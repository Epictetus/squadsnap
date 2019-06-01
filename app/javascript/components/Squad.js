import React from "react"
import PropTypes from "prop-types"

import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import AppBar from '@material-ui/core/AppBar';
import IconButton from '@material-ui/core/IconButton';
import Toolbar from '@material-ui/core/Toolbar';
import MenuIcon from '@material-ui/icons/Menu';
import Typography from '@material-ui/core/Typography';

class Squad extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      editable: false
    };
  }

  handleEdit() {
    console.log('Squad handleEdit')

    if(this.state.editable) {
      var name = this.refs.name.value;
      var sport = this.refs.sport.value;
      var owner = this.refs.owner_id.value;

      var squad = {id: id , name: name , sport: sport, owner: owner};
      this.props.handleUpdate(squad);

    }
    this.setState({ editable: !this.state.editable })
  }

  render () {
    console.log('Squad render')
    var name = this.state.editable ? <input type='text' ref='name' defaultValue={this.props.squad.name} /> : <h3>{this.props.squad.name}</h3>;
    var sport = this.state.editable ? <input type='text' ref='sport' defaultValue={this.props.squad.sport} />: <p>{this.props.squad.sport}</p>

    return (
      <React.Fragment>
        <h3>{this.props.squad.name}</h3>
        <p>Squad ID: {this.props.squad.id}</p>
        <p>Sport: {this.props.squad.sport}</p>
        <p>Owner: {this.props.squad.owner_id}</p>
        <button onClick={() => this.props.handleDelete()}>Delete</button>
        <button onClick={() => this.handleEdit()}>
            {" "}
            {this.state.editable ? "Submit" : "Edit"}{" "}
        </button>
      </React.Fragment>
    );
  }
}

export default Squad
