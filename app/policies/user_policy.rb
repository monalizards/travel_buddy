class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def edit?
    record == user
  end

  def update?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
