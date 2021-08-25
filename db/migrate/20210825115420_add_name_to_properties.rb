class AddNameToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :name, :string
    add_column :properties, :image_url, :string
  end
end
