import React from "react"
import PropTypes from "prop-types"

class NewSquad extends React.Component {
  handleClick() {
   console.log('NewSquad handleClick')
   var name = this.refs.name.value;
   var sport = this.refs.sport.value;
   var owner = this.refs.owner_id.value;
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
    console.log('NewSquad render')

    var context = this;

    return (
      <React.Fragment>
        <input ref="name" placeholder="Enter the name of the item" />
        <input ref="sport" placeholder="Enter a sport" />
        <input ref="owner_id" placeholder="Owner ID" />
        <button onClick={() => context.handleClick()}>Submit</button>
      </React.Fragment>
    );
  }
}

export default NewSquad
