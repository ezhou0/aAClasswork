import { RECEIVE_JOB } from '../actions/job_actions';

const jobsReducer = (oldState = {}, action) => {
  console.log('in jobs reducer')
  console.log("oldstate: " + oldState);
  Object.freeze(oldState);
  const nextState = Object.assign({}, oldState); // this is essentially copying old state

  switch (action.type) {
    case RECEIVE_JOB:
      console.log("inside RECEIVE_JOB");
      // nextState[action.job.id] = action.job;
      // nextState = {1: {        
      // position: 'manager',
      // amount: 2.75,
      // id: 1}
      // }
      return nextState
    default:
      return oldState
  }
}

export default jobsReducer;