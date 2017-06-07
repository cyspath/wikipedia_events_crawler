function getCachedDates(callback) {
  $.ajax({
    type: 'GET',
    url: '/api/cached_dates',
    error: function(err) {
      console.log(err);
    },
    success: function(data) {
      callback(data);
    }
  });
}

function getEvents(date, callback) {
  $.ajax({
    type: 'GET',
    data: { date: date },
    url: '/api/events',
    error: function(err) {
      console.log(err);
    },
    success: function(data) {
      callback(data);
    }
  });
}
