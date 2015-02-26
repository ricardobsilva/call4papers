class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to my_events_path, notice: 'Event was successfuly created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to my_events_path, notice: 'Event was successfuly updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to my_events_path, notice: 'Event was successfuly destroyed.'
  end

  def my
    @events = Event.where(user: current_user)
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :url, :logo)
  end

end
