import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root.jsx';
import { receiveTodo, receiveTodos, removeTodo, } from './actions/todo_actions';
import { receiveStep, receiveSteps, removeStep, } from './actions/step_actions';
import configureStore from './store/store'; // exported default 
import { allTodos } from './reducers/selectors.js';

document.addEventListener("DOMContentLoaded", () => {
  console.log("Welcome to the todos");
  const reactRoot = document.getElementById('root');
  window.store = configureStore();
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;
  window.todos = allTodos;
  ReactDOM.render(<Root store={store}/>, reactRoot);
});

//  const steps = [1: {id: 1,title: 'walk to store',done: false,todo_id: 1},2: {id: 2,title: 'buy soap',done: false, todo_id: 1}]