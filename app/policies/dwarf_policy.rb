class DwarfPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      # scope in policy == Restaurant.all in controller (because we passed it to policy_scope)
      # scope.where(user: user) # Restaurant.all.where(user: user)
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    # if restaurant belongs to current_user then allowed else disallowed

    # if record.user == user
    #   true
    # else
    #   false
    # end

    record.user == user
  end

  def destroy?
    record.user == user
  end
end
