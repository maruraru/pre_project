class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :house
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
