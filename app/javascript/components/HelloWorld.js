import React from "react"
import { connect } from 'react-redux';
import { createStructuredSelector } from 'reselect';

const GET_SQUADS_REQUEST = 'GET_SQUADS_REQUEST';
const GET_SQUADS_SUCCESS = 'GET_SQUADS_SUCCESS';

function getSquads() {
  console.log('getSquads() Action!!')
  return dispatch => {
    dispatch({ type: GET_SQUADS_REQUEST });
    return fetch(`/api/squads.json`)
      .then(response => response.json())
      .then(json => dispatch(getSquadsSuccess(json)))
      .catch(error => console.log(error));
  };
};

export function getSquadsSuccess(json) {
  return {
    type: GET_SQUADS_SUCCESS,
    json
  };
};


class HelloWorld extends React.Component {
  render () {
    const { squads } = this.props;
    const squadsList = squads.map((squad) => {
      return <li>{squad.name} {squad.sport}</li>
    })

    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
        <button className="getSquadsBtn" onClick={() => this.props.getSquads()}>getSquads</button>
        <br />
        <ul>{ squadsList }</ul>
      </React.Fragment>
    );
  }
}

const structuredSelector = createStructuredSelector({
  squads: state => state.squads,
});

const mapDispatchToProps = { getSquads };

export default connect(structuredSelector, mapDispatchToProps)(HelloWorld);
