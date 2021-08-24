class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :propery_id, :user_id, :start_date, :end_date, :ratong, presence: true
  validate :end_date, comparison: { greater_than: :start_date }
  validate :start_date, comparison: { greater_than_or_equal_to: :today }
  validates :rating, only_integer: { in: 0..5 }
end
