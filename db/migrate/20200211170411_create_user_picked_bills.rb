class CreateUserPickedBills < ActiveRecord::Migration[5.2]
  def change
    create_table :user_picked_bills do |t|
      t.references :picked_bill, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
