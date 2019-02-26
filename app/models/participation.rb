class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :user, :trip, presence: true
  validate :max_reached?

  private

  def max_reached?
    if trip.participations.count > trip.max_participants
      errors.add(:trip, "Trip has enough people, choose another one")
    end
  end
end
