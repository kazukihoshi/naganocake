class Item < ApplicationRecord
  has_one_attached :image
  
  belongs_to :genre
  
  has_many :order_details
  has_many :orders, through: :order_details
end
