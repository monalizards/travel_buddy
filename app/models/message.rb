class Message < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :user, :trip, :message, presence: true
  validates :message, length: { maximum: 140 }
end
