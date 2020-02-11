class ChangeUserOpinionColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :picked_bills, :user_opinion, :string 
  end
end
