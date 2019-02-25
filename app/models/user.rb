class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: { in: 5..15 }

  has_many :trips, as: :organizer, dependent: :destroy
  has_many :participations
  has_many :trips, through: :participations
end
