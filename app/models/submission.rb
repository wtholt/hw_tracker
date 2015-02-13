class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  has_many :comments, as: :commentable
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links, :allow_destroy => true

  include Workflow
  workflow do
    state :review do
      event :review, transitions_to: :review
      event :unfinish, transitions_to: :incomplete
      event :finish, transitions_to: :complete
    end

    state :incomplete do
      event :review, transitions_to: :review
      event :finish, transitions_to: :complete
    end

    state :complete
  end

end
