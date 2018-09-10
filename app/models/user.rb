class User < ApplicationRecord
  has_many :user_bills
  has_many :bills, through: :user_bills
  has_secure_password
  validates :name, uniqueness: { case_sensitive: false }
end
