module EventsHelper
  def belong_to_user?(creator)
    current_user.id.eql? creator
  end
end
