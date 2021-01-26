import React from 'react';

class Clock extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            currentTime: new Date().toLocaleTimeString("en-US")
        };
        this.tick = this.tick.bind(this);
    }

    tick(){
        //debugger
        this.setState({ currentTime: new Date().toLocaleTimeString("en-US")})
    }

    componentDidMount(){
        this.interval = setInterval(this.tick, 1000);
    }

    componentWillUnmount(){
        clearInterval(this.interval);
    }

    render(){
        return(
            <>
            <h1>Clock</h1>
            <h3>{this.state.currentTime}</h3>
            </>
        );

    }
}

export default Clock;