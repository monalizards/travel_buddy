class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUserUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: { in: 5..15 }

  # o_trips refers to association for organised trips

  has_many :o_trips, foreign_key: :organizer_id, class_name: 'Trip'

  # trips refers to association for participating trips

  has_many :participations
  has_many :trips, through: :participations
end
