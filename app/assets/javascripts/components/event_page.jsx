var EventPage = React.createClass({

  handleClick: function () {
    this.props.getDatesIndex()
  },

  renderContent: function () {
    // debugger
    if (this.props.spinner) {
      return (
        <img src="http://thinkfuture.com/wp-content/uploads/2013/10/loading_spinner.gif"/>
      )
    } else {
      var events = this.props.events.map(function (e) {
        return (
          <div key={e.id}>
            <h4>{e.title}</h4>
            <div><img src={e.image_url}/></div>
            <div>{e.summary}</div>
          </div>
        )
      });
      return (
        <div>{events}</div>
      )
    }
  },

  render: function() {
    var content = this.renderContent();

    return (
      <center>
        <h2>Event Summary Page</h2>
        <div onClick={this.handleClick}>BACK TO INDEX</div>
        {content}
      </center>
    )
  }
});
