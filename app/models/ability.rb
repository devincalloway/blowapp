class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
      can :publish, Post
    elsif user.role? :moderator
      can :manage, :all
    elsif user.role? :member
       can :read, :all
    end
  end
end