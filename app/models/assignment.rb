class Assignment < ActiveRecord::Base
  belongs_to :user
  has_many :submissions
  has_many :users, through: :submissions
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments, allow_destroy: true
end
