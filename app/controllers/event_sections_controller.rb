class EventSectionsController < SecuredController
  before_action :set_event
  before_action :set_event_section, only: [:show, :edit, :update, :destroy]

  def index
    @event_sections = @event.event_sections.all
  end

  def new
    @event_section = @event.event_sections.new
  end

  def edit
  end

  def show
  end

  def create
    @event_section = @event.event_sections.new(event_params)

    if @event_section.save
      redirect_to event_event_sections_path(@event),
                  notice: 'Event Section was successfuly created.'
    else
      render :new
    end
  end

  def update
    if @event_section.update(event_params)
      redirect_to event_event_sections_path(@event),
                  notice: 'Event Section was successfuly updated.'
    else
      render :edit
    end
  end

  def destroy
    @event_section.destroy
    redirect_to my_events_path,
                notice: 'Event Section was successfuly destroyed.'
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_section
    @event_section = @event.event_sections.find(params[:id])
  end

  def event_params
    params.require(:event_section).permit(:name, :description)
  end
end
