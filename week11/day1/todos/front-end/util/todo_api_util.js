import {$CombinedState} from 'redux';

export const fetchAllTodos = () => {
    return $.ajax({
        method: 'GET',
        url: '/api/todos'
    }); 
};
