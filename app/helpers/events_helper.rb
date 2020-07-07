module EventsHelper
  def belong_to_user?(creator)
    current_user.id.eql? creator
  end

  def get_event(event)
    @event_ = event
  end

  def selected_event
    @event_
  end
end
