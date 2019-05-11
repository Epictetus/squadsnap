import React from "react"
import PropTypes from "prop-types"
class AllSquads extends React.Component {
  handleDelete(id) {
    this.props.handleDelete(id);
  }

  onUpdate(item) {
      this.props.onUpdate(item);
  }

  render () {
    var squads = this.props.squads.map((squad) => {
            return (
                <div key={squad.id}>
                  <Squad squad={squad}
                       handleDelete={this.handleDelete.bind(this, squad.id)}
                       handleUpdate={this.onUpdate}/>
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
