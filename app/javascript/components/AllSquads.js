import React from "react"
import PropTypes from "prop-types"

import Squad from './Squad'

class AllSquads extends React.Component {
  handleDelete(id) {
    console.log('AllSquads handleDelete (id: ' + id + ')')
    this.props.handleDelete(id);
  }

  onUpdate(squad) {
    console.log('AllSquads onUpdate (squad: ' + squad + ')')
    this.props.onUpdate(squad);
  }

  render () {
    console.log('AllSquads render')

    var context = this;

    var squads = this.props.squads.map((squad) => {
        return (
            <div key={squad.id}>
              <Squad squad={squad}
                   handleDelete={() => context.handleDelete.bind(this, squad.id)}
                   handleUpdate={() => context.onUpdate}/>
            </div>
        )
    });

    return (
      <React.Fragment>
        {squads}
      </React.Fragment>
    );
  }
}

export default AllSquads
