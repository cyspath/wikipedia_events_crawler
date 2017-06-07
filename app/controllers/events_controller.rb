class EventsController < ApplicationController
  def index

    events = Event.for_date(Date.new(2010,1,1))
    # return render json: { status: "Update Failed", data: exception }, status: 422
    return render json: events, status: :ok
  end
end
