class Attendance < ApplicationRecord
  belongs_to :events_to_attend, class_name: 'Event'

  belongs_to :attendee, class_name: 'User'
end
