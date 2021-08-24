class AddColumnsToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :wifi, :boolean
    add_column :properties, :kitchen, :boolean
    add_column :properties, :bathroom, :boolean
    add_column :properties, :dog_friendly, :boolean
    add_column :properties, :number_beds, :integer
    add_column :properties, :air_defense, :boolean
    remove_column :properties, :facilities, :boolean
  end
end
