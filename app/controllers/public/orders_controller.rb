class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    # @addresses = current_customer.address
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    #@cart_items = current_customer.cart_items.all
    @order_details = @order.order_details
    #@cart_items.each do |cart_item|
      #@total_price += cart_item.item.add_tax_price * cart_item.subtotal
      #sum += (cart_item.item.price_without_tax * 1.1).floor * cart_item.quantity
		#end
      #@total += cart_item.subtotal
    #end
      
    #@total_price += @cart_items.subtotal
  end

  def confirm
    @order = Order.new
    @address = Address.find(params[:order][:address_id])
    #@order.postal_code = @address.postal_code
    #@order.address = @address.address
    #@order.name = @address.name
    @order.payment_method = params[:order][:payment_method]
    # @order.select_address = @address.select_address
    # @order.address_id = @address.address_id
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    @order.billing_amount = @order.postage.to_s + @total_price.to_s
    
    
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      #redirect_to orders_confirm_path
       
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      #redirect_to orders_confirm_path
       
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      #redirect_to orders_confirm_path
      
    else
      #render :new
    end
    
    #binding.pry
    #@order.save
    
  end

  def create
    @cart_items = current_customer.cart_items.all
    #order.payment_method = params[:order][:payment_method]
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart_item|
        order_details = OrderDetail.new
        order_details.item_id = cart_item.item.id
        order_details.order_id = @order.id
        order_details.quantity = cart_item.amount
        order_details.price = cart_item.item.price
        order_details.is_active = "cannot_atart"
        #order_details.name = @order.name
        order_details.save!
      end 
        
      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render :new
    end
  end


  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :select_address, :address_id, :billing_amount, :created_at, :postage)
  end
  
end
