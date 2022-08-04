class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
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
