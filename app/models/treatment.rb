class Treatment < ApplicationRecord
  belongs_to :pet
  
  enum treatment_type: {
    medication: 0,
    vaccine: 1,
    surgery: 2,
    therapy: 3,
    deworm: 4,
    antiparasitic: 5,
    other: 6
  }
  
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :treatment_type, presence: true, inclusion: { in: treatment_types.keys }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :dosage, presence: true, unless: -> { treatment_type == 'surgery' || treatment_type == 'therapy' }
  validates :frequency, presence: true, unless: -> { treatment_type == 'surgery' }
  
  validate :end_date_after_start_date
  validate :renew_date_after_end_date, if: :renew_date?
  
  private
  
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    
    if end_date < start_date
      errors.add(:end_date, "doit être postérieure à la date de début")
    end
  end
  
  def renew_date_after_end_date
    return if end_date.blank?
    
    if renew_date <= end_date
      errors.add(:renew_date, "doit être postérieure à la date de fin")
    end
  end
end
