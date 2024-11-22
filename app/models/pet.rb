class Pet < ApplicationRecord
  belongs_to :user

  validates :name, :breed, :birth_day, :gender, presence: true
end
