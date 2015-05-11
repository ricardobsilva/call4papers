class HomeController < ApplicationController
  def index
    @body_class = 'home-page'
    @event = Event.first
  end
end
