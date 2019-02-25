class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :user, :trip, presence: true
end
