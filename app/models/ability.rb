class Ability
  include CanCan::Ability
  
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :user
      can :read, :fetch, [Article]
      # can :read, [User]
      
      # manage his own user record (account)
      can :manage, User do |this_user|
        this_user == user
      end
    else
      can :read, :fetch, [Article]
    end

  end

end
