class Assignment < ActiveRecord::Base
  belongs_to :user
  has_many :submissions
  has_many :users, through: :submissions
  has_many :comments, as: :commentable
end
