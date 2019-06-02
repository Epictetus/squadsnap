import React from "react"
import PropTypes from "prop-types"

import AllSquads from './AllSquads'
import NewSquad from './NewSquad'

class Body extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      squads: []
    };
  }

  componentDidMount() {
    console.log('Body componentDidMounted')

    $.getJSON('/api/squads.json', (response) => {
      this.setState({ squads: response })
    });
  }

  handleSubmit(squad) {
    console.log('Body handleSubmit (squad: ' + squad + ')')

    var newState = this.state.squads.concat(squad);
    this.setState({ squads: newState })
  }

  handleDelete(id) {
    console.log('Body handleDelete (id: ' + id + ')')

      $.ajax({
          url: `/api/squads/${id}`,
          type: 'DELETE',
          success:() => {
              this.removeItemClient(id);
          }
      });
  }

  handleUpdate(squad) {
    console.log('Body handleUpdate (squad: ' + squad + ')')

    $.ajax({
            url: `/api/squads/${squad.id}`,
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
    console.log('Body removeItemClient (id: ' + id + ')')
    var newSquads = this.state.squads.filter((squad) => {
        return squad.id != id;
    });

    this.setState({ squads: newSquads });
  }

  render () {
    console.log('Body render')

    var context = this;

    return (
      <React.Fragment>
        <NewSquad handleSubmit={this.handleSubmit} />
        <AllSquads squads={this.state.squads}  handleDelete={() => context.handleDelete()} onUpdate={() => context.handleUpdate()}/>
      </React.Fragment>
    );
  }
}

export default Body
