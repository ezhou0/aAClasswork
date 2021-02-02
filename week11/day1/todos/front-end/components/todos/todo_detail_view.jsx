import React from 'react';
import TodoDetailViewSteps from '../step_list/step_list_container';
// import TodoItem from './todo_list_item';
// import TodoForm from './todo_form';

const TodoDetailView = (props) => {
  let detailsArray = [];
  for (const [key, value] of Object.entries(props.details)) {
    // console.log(`${key}: ${value}`);
    detailsArray.push(`${key}: ${value}`);
    console.log(detailsArray);
  }
  
  return (
    <div>
      <h2>Details</h2>
      <ul>
        {detailsArray.map((val) => <li>{val}<TodoDetailViewSteps props={props}/> </li> ) }
      </ul>
    </div>
  );
}
export default TodoDetailView;