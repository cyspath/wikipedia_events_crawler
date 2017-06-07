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
          <div key={e.id} className="col-sm-4">
            <h4>{e.title}</h4>
            <div><img src={e.image_url}/></div>
            <p>{e.summary}</p>
          </div>
        )
      });
      return (
        <div className="container">
          <div className="row">{events}</div>{events}
        </div>
      )
    }
  },

  render: function() {
    var content = this.renderContent();

    return (
      <center>
        <h1 className="display-3">Event Summary Page</h1>
        <div onClick={this.handleClick} className="btn btn-primary">{"< BACK TO INDEX"}</div>
        {content}
      </center>
    )
  }
});
