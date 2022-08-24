class Order < ApplicationRecord
  enum payment_method: {credit_card: 0, transfer: 1}
  
  enum is_active: {waiting_for_payment: 0,payment_confirmation: 1,production: 2,shipping_preparation: 3,sent: 4}
  
  has_many :order_details
  has_many :items, through: :order_details
  belongs_to :customer
  

end

