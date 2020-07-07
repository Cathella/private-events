class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :events, foreign_key: "event.id", class_name: "Event"
end
