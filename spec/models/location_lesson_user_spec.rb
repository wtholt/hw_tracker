require 'rails_helper'

RSpec.describe LocationLessonUser, type: :model do 
  it{should belong_to(:location_lesson)}
  it{should belong_to(:user)}
end