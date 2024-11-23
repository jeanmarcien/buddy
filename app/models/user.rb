class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, dependent: :destroy

  # Validations
  validates :first_name, presence: true,
  length: { minimum: 2, maximum: 50 }

  validates :last_name,  presence: true,
    length: { minimum: 2, maximum: 50 }

  # validates :address,   presence: true,
  #   length: { minimum: 5, maximum: 200 }

  # Méthodes personnalisées
  def full_name
    "#{first_name} #{last_name}".strip
  end

  def to_s
    full_name
  end
end
