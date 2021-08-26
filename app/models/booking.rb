class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true

  # private
  # def date_format
  #   if start_date < Date.today
  #     self.errors.add(:start_date, "Must be greater than today")
  #   elsif end_date < start_date
  #     self.errors.add(:end_date, "Must be after the start date")
  #   end
  # end
end
