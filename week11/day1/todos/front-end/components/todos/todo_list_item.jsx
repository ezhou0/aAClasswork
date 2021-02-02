import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';
import StepListContainer from '../step_list/step_list_container';
class TodoItem extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      title: props.todo.title,
      body: props.todo.body,
      id: props.todo.id,
      done: props.todo.done,
      details: false 
    }
    this.handleRemove = this.handleRemove.bind(this);
    this.handleDone = this.handleDone.bind(this);
    this.showDetails = this.showDetails.bind(this);
  } 

  handleRemove(e){
    e.preventDefault();
    this.props.removeTodo(this.state);
  }

  handleDone(e) {
    e.preventDefault();
    console.log("done clicked");
    this.setState({ done: !this.state.done});
    this.props.todo.done = !this.state.done;
    this.props.receiveTodo(this.props.todo);
  }

  showDetails(e) {
    e.preventDefault();
    this.setState({ details: !this.state.details });
  }

  render() {

    return (
      <>
        <h3>title: {this.state.title}</h3>
        <div>
          <button onClick={this.handleDone}
            title={this.state.title}
            id={this.state.id}
            body={this.state.body}>
            {this.state.done.toString()}
          </button>

          <button onClick={this.handleRemove}
            title={this.state.title}
            id={this.state.id}
            body={this.state.body}>
            REMOVE TODO
          </button>

          <button onClick={this.showDetails}
          > {!this.state.details && <span>SHOW DETAILS</span>}
            {this.state.details && <span>HIDE DETAILS</span>}
          </button>
        </div>
        { this.state.details && <TodoDetailViewContainer details={this.state} />}
        { this.state.details && <StepListContainer steps={this.state} />}
      </>
    )
  }
}

export default TodoItem;

