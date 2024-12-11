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
  has_many :treatments, dependent: :destroy
  has_many :measurements, dependent: :destroy
  has_many :hygienes, dependent: :destroy
  # has_many :physical_records
  has_many :nutritions, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :vet_appointments
  has_one_attached :photo
  validates :name, presence: true
  validates :specie, presence: true, inclusion: { in: SPECIES }
  validates :birth_day, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
end
