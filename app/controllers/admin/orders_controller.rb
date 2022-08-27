class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_details = @order.order_details
    @total_price = 0
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
  end 
  
  
  
  private
  
  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :billing_amount, :payment_method, :postage, :is_active, :created_at, :update_at)
  end
  
end
