require 'rails_helper'

RSpec.describe Comment, type: :model do 
  it{should belong_to(:user)}
  it{should belong_to(:commentable)}
  it{should accept_nested_attributes_for(:user)}
end