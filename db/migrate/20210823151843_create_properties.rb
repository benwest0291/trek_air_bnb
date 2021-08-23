class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :postcode
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.boolean :facilities

      t.timestamps
    end
  end
end
