var Root = React.createClass({

  getInitialState: function() {
   return {
     indexPage: true,
     spinner: false,
     dates: [],
     events: []
   };
  },

  componentDidMount: function() {
    this.getDatesIndex()
  },

  getDatesIndex: function () {
    this.setState({ indexPage: true, dates: [], spinner: true });
    getCachedDates(this.updateDates);
  },

  getEventPage: function (date) {
    this.setState({ indexPage: false, events: [], spinner: true });
    getEvents(date, this.updateEvents);
  },

  updateDates: function (dates) {
    console.log(dates);
    this.setState({ dates: dates, spinner: false });
  },

  updateEvents: function (events) {
    console.log(events);
    this.setState({ events: events, spinner: false });
  },

  render: function() {
    if (this.state.indexPage) {
      return <DatesIndex dates={this.state.dates} getEventPage={this.getEventPage} spinner={this.state.spinner}/>
    } else {
      return <EventPage events={this.state.events} getDatesIndex={this.getDatesIndex} spinner={this.state.spinner}/>
    }
  }
});
