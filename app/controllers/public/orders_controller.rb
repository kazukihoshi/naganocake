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
    @order = Order.new
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    @order.payment_method = params[:order][:payment_method]
    # @order.select_address = @address.select_address
    # @order.address_id = @address.address_id
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    @order.billing_amount = @order.postage.to_s + @total_price.to_s
    
    
    if params[:order][:select_address] == 0
      @order.postal_code = current_customer.postal_code
      @order.customer.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      redirect_to orders_confilm_path
       
    elsif params[:order][:select_address] == 1
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      redirect_to orders_confilm_path
       
    elsif params[:order][:select_address] == 2
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      redirect_to orders_confilm_path
      
    else
      #render 'new'
    end
    
    #binding.pry
    @order.save
    
  end

  def create
    
  end


  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :select_address, :address_id)
  end
  
end
