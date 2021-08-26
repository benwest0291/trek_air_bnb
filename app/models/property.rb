class Property < ApplicationRecord
  belongs_to :user
  validates :address, presence: true, uniqueness: true
  validates :description, length: { minimum: 25 }
  validates :postcode, :price, :name, :image_url, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_address,
  #  against: [ :name, :address ],
  #  using: {
  #    tsearch: { prefix: true }
  #   }
end
