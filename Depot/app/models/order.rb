class Order < ActiveRecord::Base
 PAYMENT_TYPES = ["Check", "Credit Card" , "Debit Card", "Cash on Delivery"]
 validates :name, :address, :email, presence: true
 validate: pay_type, inclusion: PAYMENT_TYPES
end
