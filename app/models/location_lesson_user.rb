class LocationLessonUser < ActiveRecord::Base
  belongs_to :location_lesson
  belongs_to :user
end
