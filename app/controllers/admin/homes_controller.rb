class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order_details = OrderDetail.all
    #@total_quantity = 0
  end
end
