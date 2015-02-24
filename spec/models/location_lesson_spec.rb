require 'rails_helper'

RSpec.describe LocationLesson, type: :model do 
  it{should belong_to(:location)}
  it{should belong_to(:lesson)}
  it{should have_many(:location_lesson_users)}
  it{should have_many(:users)}
end