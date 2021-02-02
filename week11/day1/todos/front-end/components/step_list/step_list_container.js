import { connect } from 'react-redux';
import TodoDetailViewContainer from '../todos/todo_detail_view_container';
import StepList from './step_list';
import { allSteps } from '../../reducers/selectors';
import { receiveSteps, receiveStep } from '../../actions/todo_actions';

// how does mapStateToProps pass steps and todo_id here as props? 
const mapStateToProps = state => ({
  steps: allSteps(state),
  state
});

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step)),
  receiveSteps: steps => dispatch(receiveStep(steps))
});

export default connect(null, mapDispatchToProps)(StepList);
