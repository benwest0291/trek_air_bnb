class Property < ApplicationRecord
  belongs_to :user
  validates :address, presence: true, uniqueness: true
  validates :description, length: { minimum: 25 }
  validates :postcode, :price, presence: true
end
