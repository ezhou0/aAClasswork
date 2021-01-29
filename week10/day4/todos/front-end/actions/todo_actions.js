export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodo = (toDo)=> { 
    return{
        type: RECEIVE_TODO,
         toDo
    };
};

export const receiveTodos = (toDos) => {
    return {
        type: RECEIVE_TODOS,
        toDos
    };
};


export const removeTodo = (toDo) => {
    return {
        type: REMOVE_TODO,
        toDo
    };
};





// todo {id: 1, title: asdfa, body: sdfa, done: false}

// todo co