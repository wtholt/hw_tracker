require 'rails_helper'

RSpec.describe Location, type: :model do 
  it{should have_many(:location_lessons)}
  it{should have_many(:lessons)}
end