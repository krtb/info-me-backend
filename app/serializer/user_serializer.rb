class UserSerializer < ActiveModel::Serializer
  has_many :user_bills
  has_many :bills, through: :user_bills
  attributes :name, :email, :zip_code, :political_party
end