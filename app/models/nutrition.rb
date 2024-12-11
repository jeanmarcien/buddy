class Nutrition < ApplicationRecord
  belongs_to :pet

  FOOD_TYPES = %w[dry wet].freeze

  validates :times_per_day, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :food_type, presence: true, inclusion: { in: FOOD_TYPES }
  validates :brand, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :reminder_date, presence: false
end
