class HomeController < ApplicationController
  def index
    @body_class = 'home-page'
    @events = Event.all
  end
end
