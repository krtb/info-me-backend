class PickedBill < ApplicationRecord
  has_many :user_picked_bills
  has_many :users, through: :user_picked_bills
end
