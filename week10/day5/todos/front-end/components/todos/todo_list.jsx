import React from 'react';
import TodoItem from './todo_list_item';
import TodoForm from './todo_form';

const todoIndex = ({todos}) => {
    return(
        <div> 
            <h1>EVERYTHING TODO </h1>
            <ul>
                {todos.map((toDo) => (
                    <TodoItem key={toDo.id} todo={toDo} />
                    
                ))}
            </ul>
            <TodoForm />
        </div>
    );
}
export default todoIndex;




// import TeaForm from './tea_form';

// const TeaIndex = (props) => {
//   return (
//     <div>
//       <h1>All the teas</h1>
//       <ul>
//         {props.teas.map((tea) => ( // implicit return, no return statement needed
//           <li key={tea.id}>flavor: {tea.flavor}</li>
//         ))}
//       </ul>
//       <h3>Green Teas</h3>
//       <ul>
//         {props.greenTeas.map(tea => { // explicit return, return statement necessary 
//           return <li key={tea.id}>flavor: {tea.flavor}</li>
//         })}
//       </ul>
//       {/* <TeaForm /> // TeaForm will not have receiveTea in this case. Must be passed as a prop */}
//       <TeaForm receiveTea={props.receiveTea} />
//     </div>
//   );
// }

// export default TeaIndex;