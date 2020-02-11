class UserPickedBill < ApplicationRecord
  belongs_to :picked_bill
  belongs_to :user
end
