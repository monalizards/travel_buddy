class ReviewPolicy < ApplicationPolicy
  def create?
    record.trip.participant == user || record.trip.organizer == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
