class LocationLesson < ActiveRecord::Base
  belongs_to :location
  belongs_to :lesson
  has_many :location_lesson_users
  has_many :users, through: :location_lesson_users
end
