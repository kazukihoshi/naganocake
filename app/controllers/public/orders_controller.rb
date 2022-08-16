class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  def index
  end

  def show
  end

  def confirm
  end

  def complete
  end
end
