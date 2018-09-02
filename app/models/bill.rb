class Bill < ApplicationRecord
    has_many :user_bills
    has_many :users, through: :user_bills
end
