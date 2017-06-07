var DatesIndex = React.createClass({

  getInitialState: function() {
   return { val: "" };
  },

  handleClick: function (date) {
    this.props.getEventPage(date)
  },

  handleTextChange: function (e) {
    this.setState({ val: e.target.value });
  },

  render: function() {
    var that = this;
    var dates = this.props.dates.map(function (d) {
      return (
        <h3 key={d.date} className="container">
          <a onClick={that.handleClick.bind(that, d.date)}>{d.date}</a>
        </h3>
      )
    });

    return (
      <center>
        <container>
          <h1 className="display-3">Date Index Page</h1>
          <div className="row">
            <div className="col-sm-4"></div>
            <div className="form-group col-sm-4">
              <input type="text" className="form-control" onChange={this.handleTextChange} value={this.state.val} placeholder="example: 2010-01-25" />
              <button onClick={that.handleClick.bind(this, this.state.val)} className="btn btn-primary form-control">Submit</button>
            </div>
            <div className="col-sm-4"></div>
          </div>
          <div className="row">
            {dates}
          </div>
        </container>
      </center>
    )
  }
});
