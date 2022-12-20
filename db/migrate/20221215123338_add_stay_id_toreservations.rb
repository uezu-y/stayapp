class AddStayIdToreservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :stay_id, :string
  end
end
