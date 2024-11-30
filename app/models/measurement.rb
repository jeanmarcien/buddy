class Measurement < ApplicationRecord
  belongs_to :pet
  enum :measurement_type, { height: 0, weight: 1 }
end
