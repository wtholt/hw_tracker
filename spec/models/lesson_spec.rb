require 'rails_helper'

RSpec.describe Lesson, type: :model do 
  it{should have_many(:location_lessons)}
  it{should have_many(:locations)}
end