class Trip < ApplicationRecord
  geocoded_by :destination

  mount_uploader :photo, PhotoTripUploader

  belongs_to :organizer, class_name: 'User'
  has_many :participations
  has_many :users, through: :participations
  has_many :reviews

  validates :organizer_id, :destination, :start_date, :end_date, :budget,
            :title, :description, :max_participants, presence: true
  validate :date_valid?

  validates :title, presence: true, uniqueness: true, length: { maximum: 30 }

  after_validation :geocode, if: :will_save_change_to_destination?

  private

  def date_valid?
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "start date must be after today")
    elsif start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, "start date must be before end date")
    end
  end
end
