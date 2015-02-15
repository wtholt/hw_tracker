class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :show, Submission, :user_id => user.id
      can :update, Submission, :user_id => user.id
      can :destroy, Comment, :user_id => user.id
    end
  end
end
