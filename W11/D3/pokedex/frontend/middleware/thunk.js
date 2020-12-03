// const thunk = store => {
//     return next => {
//         return action => {
//             if (typeof action === 'function') {
//                 return action(store.dispatch, store.getState);
//             } else {
//                 return next(action);
//             }
//         };
//     };
// };

const thunk = ({ dispatch, getState }) => next => action => {
    if (typeof action === 'function') {
        return action(dispatch, getState);
    } else {
        return next(action)
    }
}

export default thunk;