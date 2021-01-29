import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from '../actions/step_actions';

const stepsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach(step => {
        newState[step.id] = step;
      });
      return newState;
    case RECEIVE_STEP:
      let newStep = { [action.step.id]: action.step };
      return Object.assign({}, state, newStep);
    case REMOVE_STEP:
      let removed = [action.step.id];
      delete newState[removed];
      return newState;
    default:
      return state;
  }
}

export default stepsReducer;