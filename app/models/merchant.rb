class Merchant < ApplicationRecord
  has_many :products
  has_many :orders, through: :products
  validates :merchant_name, presence: true
  validates :merchant_email, presence: true
  validates :username, presence: true
end
