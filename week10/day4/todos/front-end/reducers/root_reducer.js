import { combineReducers } from 'redux';
import toDosReducer from './todos_reducer';
import stepsReducer from './steps_reducer';
// import jobsReducer from './job_reducer';

const rootReducer = combineReducers({
  toDos: toDosReducer, // create slice of state with key of jobs, 
  steps: stepsReducer
  // and points to jobs reducer
})

export default rootReducer;