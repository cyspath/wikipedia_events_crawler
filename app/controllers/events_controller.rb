class EventsController < ApplicationController
  def index
    # return render json: { status: "Update Failed", data: exception }, status: 422
    return render json: Spider.new(Date.new(2010,1,1)).run, status: :ok
  end
end
