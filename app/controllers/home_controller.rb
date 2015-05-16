class HomeController < ApplicationController
  def index
    @body_class = 'home-page'
    @upcoming_events = Event.upcoming
    @latest_events = Event.latest
  end
end
