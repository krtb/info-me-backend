class CreatePickedBills < ActiveRecord::Migration[5.2]
  def change
    create_table :picked_bills do |t|
      t.string :api_bill_id
      t.string :chamber
      t.string :bill_number
      t.string :description
      t.string :bill_url
      t.string :legislative_day
      t.boolean :user_opinion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
