class Clock {
    construction() {
        let date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();
        this.printTime();
        window.setInterval(this._tick.bind(this), 1000);
    };

    printTime() {
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    };

    _tick() {
        if(this.seconds === 59){
            if(this.minutes === 59){
                    if(this.hours === 23){
                        this.hours = 0;
                    } else {
                        this.hours ++;
                    }
                this.minutes = 0;
            } else {
                this.minutes ++;
            }
            this.seconds = 0;
        } else {
            this.seconds ++;
        }
        this.printTime();
    }
};

const clock = new Clock();