class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :roomtype
      t.float :price
      t.text :description
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
