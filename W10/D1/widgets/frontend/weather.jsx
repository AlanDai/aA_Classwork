import React from 'react';

class Weather extends React.Component {
    constructor(props) {
        super(props);
        this.state = {}
    }

    componentDidMount() {
        navigator.geolocation.getCurrentPosition(() => this.getWeather)
    }

    getWeather(location) {
        const lat = location.coords.latitude;
        const lon = location.coords.longitude;
        const apiKey = '23ac37058c2e6039821067a28d3cf239'
        const url = `api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}`
        const xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = () => {
            if(xmlhttp.readState == XMLHttpRequest.DONE) {
                const weather = JSON.parse(xmlhttp.responseText);
                this.setState({ weather });
            }
        };

        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    render() {
        const { weather } = this.state;
        let content = <div></div>
        if(weather) {
            content = <div className="weather">
                                <p>{weather.name}</p>
                                <p>{weather.main.temp}</p>
                            </div>
        } else {
            content = <div>Looking for weather</div>
        }      
        return(
            <div>
                <h1 className="title">THE WEATHER</h1>
                {content}
            </div>
        );
    }
}

export default Weather;