import { createStore, applyMiddleware } from "redux";

import thunk from 'redux-thunk';

const initialState = {
  squads: [
    {
      name: "testName",
      sport: "testSport"
    }
  ]
};

function rootReducer(state, action) {
  console.log(action.type);
  switch (action.type) {
    case "GET_SQUADS_SUCCESS":
      return { squads: action.json.squads };
  }
  return state;
}

export default function configureStore() {
  const store = createStore(
    rootReducer,
    initialState,
    applyMiddleware(thunk)
  );
  return store;
}
