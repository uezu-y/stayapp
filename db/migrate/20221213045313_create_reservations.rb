class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :startdate
      t.date :enddate
      t.integer :number
      t.integer :total_amount
      t.integer :totaldays
      t.integer :roomstay_id
      t.string :user_id

      t.timestamps
    end
  end
end
