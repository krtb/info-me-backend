class BillSerializer < ActiveModel::Serializer
  has_many :user_bills
  has_many :users, through: :user_bills
  attributes :api_bill_id, :for_bill?
end