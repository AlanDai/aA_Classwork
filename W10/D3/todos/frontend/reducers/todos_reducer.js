import { RECEIVE_TODOS, RECEIVE_TODO } from "../actions/todo_actions";

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (currentState = initialState, action) => {
  Object.freeze(currentState);

  switch (action.type) {
    case RECEIVE_TODOS:
      nextState = {};
      action.todos.forEach((todo) => {
        nextState[todo.id] = todo;
      });
      return nextState;

    case RECEIVE_TODO:
        const newTodo = {[action.todo.id]: action.todo}
        return Object.assign({}, currentState, newTodo);

    default:
      return currentState;
  }
};

export default todosReducer;