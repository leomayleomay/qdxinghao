class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
      can [:create, :update, :destroy], [Page, Broadcast, Product, Asset, Recruitment]
    else
      can :read, :all
      can :index, Order do |order|
        user.role?(:admin)
      end
      can :show, Order do |order| 
        order.try(:user) == user || user.role?(:admin)
      end
      can :index, User do |u|
        user.role?(:admin)
      end

      can [:show, :edit, :update, :destroy], User do |u|
        u == user || user.role?(:admin)
      end

      can [:new, :create], User

      can [:new, :create, :edit, :update], Message

      can [:create, :update, :destroy], Order
      can :category, [Broadcast, Product, Asset]
    end
  end
end
