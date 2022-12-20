class RemoveRoomstayIdFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :roomstay_id, :integer
  end
end
