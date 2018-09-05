class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :api_bill_id
      t.string :chamber
      t.string :bill_number
      t.string :description
      t.string :bill_url
      t.string :legislative_day
      t.boolean :for_bill?
      t.timestamps
    end
  end
end
