class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :api_bill_id
      t.boolean :for_bill?

      t.timestamps
    end
  end
end
