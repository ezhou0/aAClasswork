import React from "react";
import {Route} from 'react-router-dom';
import GreetingContainer from './greeting/greeting_container';
import SignupFormContainer from './session_form/signup_form_container';
import LoginFormContainer from './session_form/login_form_container';
import {AuthRoute} from '../util/route_util';

const App = () => (
    <div>
        <header>
        <h1>Bench BnB</h1>
        <GreetingContainer />
        </header>
        <AuthRoute exact path="/login" component={LoginFormContainer} />
        <AuthRoute exact path="/signup" component={SignupFormContainer} />
        
    </div>
);

export default App;