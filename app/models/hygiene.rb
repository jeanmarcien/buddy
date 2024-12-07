class Hygiene < ApplicationRecord
  belongs_to :pet

  enum hygiene_type: {
    nutrition: 0,
    groom: 1,
    teeth: 2,
    claw: 3,
    litter: 4,
    bath: 5,
    ears: 6
  }

  validates :hygiene_type, presence: true, inclusion: { in: hygiene_types.keys }
  validates :date, presence: true
  validates :frequency, presence: true
end
