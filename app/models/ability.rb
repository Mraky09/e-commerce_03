class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    case user.role
    when "admin"
      can :manage, :all
    when "user"
      can :read, :all
      can :create, [AddressBook, Comment, Order, OrderDetail, Rate, Request]
      can :update, [AddressBook, Order, OrderDetail]
      can :destroy,[Comment]
    else
      can :read, [Category, Comment, Order, OrderDetail, Product, Rate,
        Specification, User]
    end
  end
end
