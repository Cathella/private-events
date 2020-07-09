class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "events_to_attend_id", class_name: "Attendance"
  has_many :attendees, through: :attendances

  def past
    Event.where("time < ?", Time.now)
  end

  def upcoming
    Event.where("time >= ?", Time.now)
  end
end
