class AddUserIdToPickedBills < ActiveRecord::Migration[5.2]
  def change
    add_column :picked_bills, :user_id, :integer
  end
end
