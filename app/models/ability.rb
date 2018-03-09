class Ability
  include CanCan::Ability

  # Define abilities for the passed in user here.
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :manage, Order, id: user.id

    # Example with admin attribute
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument is action permission.
    # :manage will apply to every action. Other common actions are :read,
    # :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # :all will apply to every resource. Otherwise pass a Ruby class of the
    # resource.
    #
    # The third argument is an optional hash of conditions for filtering
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
