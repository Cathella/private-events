class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :attendances, foreign_key: 'attendee_id', class_name: 'Attendance'
  has_many :events_to_attend, through: :attendances

  def previous_events
    events_to_attend.where('time < ?', Time.now)
  end

  def upcoming_events
    events_to_attend.where('time >= ?', Time.now)
  end

  def my_events
    events.where(creator_id: User.id)
  end
end
