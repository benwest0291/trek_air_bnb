class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :properties
  has_many :bookings
  validates :first_name, :last_name, :address, :postcode, presence: true
  validates :username, presence: true, uniqueness: true
end
