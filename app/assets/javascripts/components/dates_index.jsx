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
        <div key={d.date}>
          <a onClick={that.handleClick.bind(that, d.date)}>{d.date}</a>
        </div>
      )
    });

    return (
      <center>
        <h2>Date Index Page</h2>
        <input type="text" onChange={this.handleTextChange} value={this.state.val} placeholder="example: 2010-01-25" />
        <button onClick={that.handleClick.bind(this, this.state.val)}>Submit</button>
        <div>{dates}</div>
      </center>
    )
  }
});
