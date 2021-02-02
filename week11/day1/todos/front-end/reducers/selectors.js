import React from 'react';

const thisToDo = ({ todos }) => {
  const todosArr = Object.values({todos});
  return todosArr;
}

// export default allTodos;
export const allTodos = ({ toDos }) => (
    //console.log("todos: " + toDos);
    Object.keys(toDos).map(id => toDos[id])
)

export const allSteps = ({ steps }) => (
  //console.log("todos: " + toDos);
  Object.keys(steps).map(id => steps[id])
)



