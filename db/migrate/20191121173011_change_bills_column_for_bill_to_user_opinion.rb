class ChangeBillsColumnForBillToUserOpinion < ActiveRecord::Migration[5.2]
  def change
    rename_column :bills, :for_bill?, :user_opinion
  end
end
