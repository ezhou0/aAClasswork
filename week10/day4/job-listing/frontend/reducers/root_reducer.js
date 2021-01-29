import { combineReducers } from 'redux';
import jobsReducer from './job_reducer';
// import jobsReducer from './job_reducer';

const rootReducer = combineReducers({
  jobs: jobsReducer, // create slice of state with key of jobs, 
  // and points to jobs reducer

})

export default rootReducer;