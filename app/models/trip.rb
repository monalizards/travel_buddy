class Trip < ApplicationRecord
  belongs_to :organizer, class_name: "User"
  has_many :participations
  has_many :users, through: :participations

  validates :organizer_id, :destination, :start_date, :end_date, :budget,
            :title, :description, :max_participants, presence: true
  validate :date_valid?

  private

  def date_valid?
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "start date must be after today")
    elsif start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, "start date must be before end date")
    end
  end
end
