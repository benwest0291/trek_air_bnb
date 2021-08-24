class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :property_id, :user_id, :start_date, :end_date, :rating, presence: true
  validate :date_format
  validates :rating, inclusion: { in: 0..5 }
  private
  def date_format
    if start_date < Date.today
      self.errors.add(:start_date, "Must be greater than today")      
    elsif end_date < start_date
      self.errors.add(:end_date, "Must be after the start date")
    end
  end
end
