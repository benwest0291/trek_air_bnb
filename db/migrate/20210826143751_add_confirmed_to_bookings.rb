class AddConfirmedToBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :rating
    add_column :bookings, :confirmed, :boolean, default: false
  end
end
