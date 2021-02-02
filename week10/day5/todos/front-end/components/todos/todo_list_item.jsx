import React from 'react';

const TodoItem = ({todo}) => {
  return (
    <li>item: {todo.title}</li>
  );
}

export default TodoItem;