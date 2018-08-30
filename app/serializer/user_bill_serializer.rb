class UserBillSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :bill
  attributes :user_id, :bill_id
end