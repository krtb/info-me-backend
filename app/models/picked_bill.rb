class PickedBill < ApplicationRecord
  # validation spans across multiple columns, for has-many-through duplicate issue
  validates_uniqueness_of :bill_number, :scope => :user_id
  has_many :user_picked_bills, dependent:  :destroy
  has_many :users, :through => :user_picked_bills
end
