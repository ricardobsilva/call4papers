class RatingsController < SecuredController
  before_action :set_event
  before_action :set_event_section
  before_action :set_proposal

  def create
    @rating = @proposal.ratings.new
    @rating.user = current_user

    if @rating.save
      redirect_to event_path(@event),
                  notice: 'Vote successfully computed.'
    else
      redirect_to event_path(@event),
                  alert: @rating.errors.full_messages.join('<br>')
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_section
    @event_section = @event.event_sections.find(params[:event_section_id])
  end

  def set_proposal
    @proposal = @event_section.proposals.find(params[:proposal_id])
  end
end
