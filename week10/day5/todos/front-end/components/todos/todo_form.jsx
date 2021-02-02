import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      title: '',
      body: '',
      done: false
    }
    this.updateBody = this.updateBody.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateTitle(e) {
    this.setState({title: e.target.value } );
  }

  updateBody(e) {
    this.setState({ body: e.target.value })
  }

  handleSubmit(e) {
    // default form behavior is to submit a get request with query string added to URL
    e.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({ title: e.target.title, body: this.target.body })

  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <h1>Add Todo</h1>

        <label>Title
          <input onChange={this.updateTitle} type="text" value={this.state.title} />
        </label>

        <label>Body
          <input onChange={this.updateBody} type="text" value={this.state.body} />
        </label>

        <input type="submit" value="Add Todo"></input>
      </form>
    )
  }

}

export default TodoForm;