class AddUserIdToStays < ActiveRecord::Migration[6.1]
  def change
    add_column :stays, :user_id, :string
  end
end
