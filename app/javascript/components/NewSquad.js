import React from "react"
import PropTypes from "prop-types"

class NewSquad extends React.Component {

  handleClick() {
    console.log('newsquad handle click')
    var name = this.ref.name.value;
    var sport = this.ref.sport.value;
    var owner = this.ref.owner_id.value;
    $.ajax({
      url: "api/v1/squads",
      type: "POST",
      data: { squad: { name: name, sport: sport, owner: owner } },
      success: squad => {
        this.props.handleSubmit(squad);
      }
   });
 }

  render () {
    return (
      <React.Fragment>
        <input ref="name" placeholder="Enter a squad name" />
        <input ref="sport" placeholder="Enter a sport" />
        <input ref="owner_id" placeholder="{current_user.id}" />
        <button onClick={this.handleClick}>Submit</button>
      </React.Fragment>
    );
  }
}

export default NewSquad
