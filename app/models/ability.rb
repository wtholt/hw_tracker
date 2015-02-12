class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      # can :read, @submission, :active => true, :user_id => user.id
      # can :create, @submission, :active => true, :user_id => user.id
      # cannot :read, @submission
      # can :read, Assignment
      # cannot :destroy, @assignment
      # cannot :create, @assignment
      # cannot :update, @assignment
      # can :read, @location
      # cannot :update, @location
      # cannot :create, @location
      # cannot :destroy, @location
    end
  end
end
