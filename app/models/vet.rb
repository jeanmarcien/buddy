class Vet < ApplicationRecord
  has_many :pets
  has_many :vet_appointments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
end
