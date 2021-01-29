import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos, removeTodo, } from './actions/todo_actions';
import { receiveStep, receiveSteps, removeStep, } from './actions/step_actions';
import configureStore from './store/store'; // exported default 

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

  ReactDOM.render(<h1>welcome to todo app</h1>, reactRoot);
})

//  const steps = [1: {id: 1,title: 'walk to store',done: false,todo_id: 1},2: {id: 2,title: 'buy soap',done: false, todo_id: 1}]