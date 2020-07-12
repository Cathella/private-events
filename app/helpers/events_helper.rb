module EventsHelper
  def belong_to_user?(creator)
    current_user.id.eql? creator
  end

  def past?(event_date)
    event_date < Time.now
  end
end
