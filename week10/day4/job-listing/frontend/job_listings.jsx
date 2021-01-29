import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './components/widget';
import configureStore from './store/store'; // exported default 

// import { receiveGreenTea } from './actions/tea_actions';
import { receiveJob } from './actions/job_actions'; // exported various functions
// import * as teaActions from './actions/tea_actions'; teaActions.receiveTea


document.addEventListener("DOMContentLoaded", () => {
  console.log("Welcome to the job listings");
  const reactRoot = document.getElementById('root');
  window.store = configureStore(); // Creates Store for us

  window.receiveJob = receiveJob;
  ReactDOM.render(<Widget />, reactRoot);
})