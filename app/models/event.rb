class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'events_to_attend_id', class_name: 'Attendance'
  has_many :attendees, through: :attendances, dependent: :destroy

  validates :time, presence: true
  validates :title, presence: true

  scope :upcoming, -> { where('time >= ?', Time.now) }
  scope :past, -> { where('time < ?', Time.now) }
end
