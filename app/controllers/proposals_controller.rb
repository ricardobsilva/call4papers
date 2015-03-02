class ProposalsController < SecuredController
  before_action :set_event
  before_action :set_event_section
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @proposals = @event_section.proposals.all
  end

  def new
    @proposal = @event_section.proposals.new
  end

  def edit
  end

  def show
  end

  def create
    @proposal = @event_section.proposals.new(event_params)
    @proposal.user = current_user

    if @proposal.save
      redirect_to event_path(@event), notice: 'Proposal was successfuly created.'
    else
      render :new
    end
  end

  def update
    if @proposal.update(event_params)
      redirect_to event_path(@event), notice: 'Proposal was successfuly updated.'
    else
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to my_events_path, notice: 'Proposal was successfuly destroyed.'
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_section
    @event_section = @event.event_sections.find(params[:event_section_id])
  end

  def set_proposal
    @proposal = @event_section.proposals.find(params[:id])
  end

  def event_params
    params.require(:proposal).permit(:title, :public_description, :private_description)
  end
end
