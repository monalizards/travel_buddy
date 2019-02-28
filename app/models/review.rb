class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :user, presence: true
  validates :trip, presence: true
end
