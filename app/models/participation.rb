class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :user, :trip, presence: true
  validate :max_reached?, :organizer?, :participant?

  private

  def max_reached?
    if trip.participations.count >= trip.max_participants
      errors.add(:base, "Trip has enough people, choose another one")
    end
  end

  def organizer?
    if trip.organizer == user
      errors.add(:base, "You can't book on your own trip!")
    end
  end

  def participant?
    if trip.users.include? user
      errors.add(:base, "You already partipated!")
    end
  end
end
