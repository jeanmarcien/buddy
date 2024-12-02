class Measurement < ApplicationRecord
  belongs_to :pet
  enum :measurement_type, { height: 0, weight: 1 }
  
  validates :date, presence: true
  validates :measurement_type, presence: true
  validates :value, presence: true, numericality: { greater_than: 0 }
end
