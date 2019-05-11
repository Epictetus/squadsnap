import React from "react"
import PropTypes from "prop-types"
class Squad extends React.Component {
  getInitialState() {
    return {editable: false}
  }

  handleEdit() {
      if(this.state.editable) {
          var name = this.refs.name.value;
          var sport = this.refs.sport.value;
          var owner = this.refs.owner_id.value;

          var squad = {id: id , name: name , sport: sport, owner: owner};
          this.props.handleUpdate(item);

      }
      this.setState({ editable: !this.state.editable })
  }

  render () {
    var name = this.state.editable ? <input type='text' ref='name' defaultValue={this.props.squad.name} /> : <h3>{this.props.squad.name}</h3>;
    var sport = this.state.editable ? <input type='text' ref='sport' defaultValue={this.props.squad.sport} />: <p>{this.props.squad.sport}</p>

    return (
      <React.Fragment>
        <h3>{this.props.squad.name}</h3>
        <p>Sport: {this.props.squad.sport}</p>
        <p>Owner: User.find(this.props.squad.owner_id).name %></p>
        <button onClick={this.props.handleDelete}> Delete </button>
        <button onClick={this.handleEdit}>
            {" "}
            {this.state.editable ? "Submit" : "Edit"}{" "}
        </button>
      </React.Fragment>
    );
  }
}

export default Squad
