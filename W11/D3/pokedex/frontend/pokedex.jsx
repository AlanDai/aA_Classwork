import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon } from './actions/pokemon_actions';
import { fetchAllPokemon } from './util/api_util';
import configureStore from './store/store';
// import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
    // const preloadedState = localStorage.state ?
    // JSON.parse(localStorage.state) : {};
  const store = configureStore();

  // TESTING
  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // END TESTING

  const root = document.getElementById('root');
  ReactDOM.render(<div>React ain't not working</div>, root);
});
