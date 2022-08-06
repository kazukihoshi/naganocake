class Item < ApplicationRecord
  has_one_attached :image
  
  belongs_to :genre
  
  has_many :order_details
  has_many :orders, through: :order_details
  
  def add_tax_price
    (self.price * 1.10).round
  end  
  
end
