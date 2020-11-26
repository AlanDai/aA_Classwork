import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store";
import { receiveTodo } from "./actions/todo_actions";

document.addEventListener("DOMContentLoaded", () => {
    // const preloadedState = {
    //     todos:{
    //         1: {
    //             id: 1,
    //             title: "wash car",
    //             body: "with soap",
    //             done: false
    //         }
    //     }    
    // }
    // const store = configureStore(preloadedState); 
    const store = configureStore(); 
    window.receiveTodo = receiveTodo;
    window.store = store;

    const root = document.getElementById('root');
    ReactDOM.render(<div>Howdy</div>, root);
})

