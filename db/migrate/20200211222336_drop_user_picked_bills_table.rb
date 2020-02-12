class DropUserPickedBillsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_picked_bills
  end
end
