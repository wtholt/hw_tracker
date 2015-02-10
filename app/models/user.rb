class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :assignments
  has_many :submissions
  belongs_to :location
  has_many :location_lesson_users
  has_many :location_lessons, through: :location_lesson_users
end
