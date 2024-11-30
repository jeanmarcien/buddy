class Pet < ApplicationRecord
  SPECIES  = [
    "Dog",
    "Cat",
    "Rabbit",
    "Other"
  ]

  GENDERS = [
    "Male",
    "Female"
  ]

  belongs_to :user
  belongs_to :vet, optional: true

  has_many :treatments # décommenté
  has_many :measurements # ajouté
  # has_many :physical_records
  # has_many :nutritions
  # has_many :activities
  has_many :vet_appointments

  validates :name, presence: true
  validates :specie, presence: true, inclusion: { in: SPECIES }
  validates :breed, presence: true
  validates :birth_day, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
end
