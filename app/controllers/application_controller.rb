class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :attending?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def attending?(event_id)
    current_user.events_to_attend.where(id: event_id).any?
  end
end
