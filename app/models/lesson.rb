class Lesson < ActiveRecord::Base
  has_many :location_lessons
  has_many :locations, through: :location_lessons
end
