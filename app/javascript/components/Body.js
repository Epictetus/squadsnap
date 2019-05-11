import React from "react"
import PropTypes from "prop-types"

import AllSquads from './AllSquads'
import NewSquad from './NewSquad'

class Body extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      squads: []
    };
  }

  componentDidMount() {
    $.getJSON('/api/v1/squads.json', (response) => {
      this.setState({ squads: response })
    });
  }

  handleSubmit(squad) {
    var newState = this.state.squads.concat(squad);
    this.setState({ squads: newState })
  }

  handleDelete(id) {
      $.ajax({
          url: `/api/v1/squads/${id}`,
          type: 'DELETE',
          success:() => {
              this.removeItemClient(id);
          }
      });
  }

  handleUpdate(squad) {
    $.ajax({
            url: `/api/v1/squads/${squad.id}`,
            type: 'PUT',
            data: { squad: squad },
            success: () => {
                this.updateSquads(squad);
            }
        }
    )}

    updateSquads(squad) {
    var squads = this.state.squads.filter((i) => { return i.id != squad.id });
    squads.push(squad);

    this.setState({squads: squads });
  }

  removeItemClient(id) {
    var newSquads = this.state.squads.filter((squad) => {
        return squad.id != id;
    });

    this.setState({ squads: newSquads });
  }

  render () {
    return (
      <React.Fragment>
        <NewSquad handleSubmit={this.handleSubmit} />
        <AllSquads squads={this.state.squads}  handleDelete={this.handleDelete} onUpdate={this.handleUpdate}/>
      </React.Fragment>
    );
  }
}

export default Body
