class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    record.organizer == user
  end

  def create?
    show?
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
