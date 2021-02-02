import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions';
const StarterToDos = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const toDosReducer = (state = StarterToDos, action) => {
  Object.freeze(state);
  let newState = Object.assign({}, state);
  switch(action.type){
    case RECEIVE_TODOS:
      action.toDos.forEach(toDo => {
        newState[toDo.id] = toDo; 
      }); 
      return newState;
    case RECEIVE_TODO:
      let newToDo = { [action.toDo.id]: action.toDo };
      return Object.assign({}, state, newToDo);
    case REMOVE_TODO:
      let removed = [action.toDo.id];
      delete newState[removed];
      return newState;
    default: 
      return state;
  }
}

export default toDosReducer;