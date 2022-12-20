class CreateStays < ActiveRecord::Migration[6.1]
  def change
    create_table :stays do |t|
      t.string :room
      t.string :introduction
      t.integer :price
      t.string :address
      t.string :img

      t.timestamps
    end
  end
end
