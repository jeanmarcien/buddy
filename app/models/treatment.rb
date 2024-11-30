class Treatment < ApplicationRecord
  belongs_to :pet
  enum :treatment_type, { vaccine: 0, deworm: 1, antiparasitic: 2, other: 1000 }
end
