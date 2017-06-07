Rails.application.routes.draw do

  root 'events#index' # this is the entry point for the UI

  namespace :api do
    get '/cached_dates', to: 'api#cached_dates'
    get '/events', to: 'api#events'
  end
end
