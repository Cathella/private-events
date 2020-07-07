class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :events, foreign_key: "event.id", class_name: "Event" # events user create
  has_many :attendances, foreign_key: "attendee_id", class_name: "Attendance"
  has_many :events_to_attend, through: :attendances # events user attend
end
