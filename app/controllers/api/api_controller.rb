class Api::ApiController < ApplicationController

  def cached_dates
    dates = Event.select(:date).group(:date)
    render json: dates, status: :ok
  rescue => exception
    error(exception)
  end

  def events
    events = Event.for_date(params[:date].to_date)
    render json: events, status: :ok
  rescue => exception
    error(exception)
  end

  private

  def error(e)
    render json: { data: exception }, status: 500
  end
end
