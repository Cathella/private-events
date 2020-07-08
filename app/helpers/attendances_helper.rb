module AttendancesHelper
  def is_attending?(event_id)
    Attendance.where(events_to_attend_id: event_id, attendee_id: current_user.id).any? # check if user is attending the event
  end
end
