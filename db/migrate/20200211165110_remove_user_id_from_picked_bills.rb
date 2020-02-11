class RemoveUserIdFromPickedBills < ActiveRecord::Migration[5.2]
  def change
    remove_column :picked_bills, :user_id, :index
  end
end
