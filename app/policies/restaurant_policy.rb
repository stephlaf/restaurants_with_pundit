class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  # def edit?
  #   # current_user == user
  #   # record == @restaurant (arg passed to #authorize)
  #   # If the user is the owner => true
  #   # Else => false
  #   record.user == user
  # end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
