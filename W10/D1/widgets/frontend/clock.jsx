import React from 'react';

const week = { 1: 'Mon', 2: 'Tue', 3: 'Wed', 4: 'Thu', 5: 'Fri', 6: 'Sat', 7: 'Sun'}
const months = { 1: 'JAN', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun', 7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'}

class Clock extends React.Component {
    constructor() {
        super();
        this.state = {
            time: new Date()
        };
        this.tick = this.tick.bind(this);
    };
    
    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalId);
    }

    tick() {
        const time = new Date();
        this.setState({ time });
    }

    render() {
        const { time } = this.state;

        let hours = time.getHours();
        hours = hours < 10 ? '0' + hours : hours;
        let minutes = time.getMinutes();
        minutes = minutes < 10 ? '0' + minutes : minutes;
        let seconds = time.getSeconds();
        seconds = seconds < 10 ? '0' + seconds : seconds;
        
        let year = time.getFullYear();
        let month = months[time.getMonth()];
        let date = time.getDate();
        let day = week[time.getDay()];
        
        return(
            <div>
                <h1 id="title">A CLOCK</h1>
                <div className="clock">
                    <div>
                        <p>Time:</p>
                        <p>{hours}:{minutes}:{seconds} PDT</p>
                    </div>
                    <div>
                        <p>Date:</p>
                        <p>{day} {month} {date} {year}</p>
                    </div>
                </div>                
            </div>
        );
    };
}

export default Clock;