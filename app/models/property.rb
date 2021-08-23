class Property < ApplicationRecord
  belongs_to :user
  validates :address, :user_id, presence: true, uniqueness: true
  validates :description, length: { minimum: 25 }
  validates :postcode, :price, presence: true
end
