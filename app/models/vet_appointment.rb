class VetAppointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet

  # Validations
  validates :date, presence: true
  validates :reason, presence: true

  # Si tu veux que la date soit future
  validate :date_cannot_be_in_the_past, on: :create

  private

  def date_cannot_be_in_the_past
    if date.present? && date < Date.current
      errors.add(:date, "The date can't be in the future.")
    end
  end
end
