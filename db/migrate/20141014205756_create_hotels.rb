class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :photo
      t.boolean :breakfast
      t.float :raiting

      t.timestamps
    end
  end
end
