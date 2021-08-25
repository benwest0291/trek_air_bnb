class Property < ApplicationRecord
  belongs_to :user
  validates :address, presence: true, uniqueness: true
  validates :description, length: { minimum: 25 }
  validates :postcode, :price, :name, :image_url, presence: true
end
