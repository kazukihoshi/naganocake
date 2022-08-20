class Public::CartItemsController < ApplicationController
  def index
    #@cart_item = CartItem.new(cart_item_params)
    @cart_items = current_customer.cart_items
    @total_price = 0
  end
  
  def create
    #binding.pry
    #@cart_item = CartItem.new(cart_item_params)
    #p cart_item
    #@cart_item.customer_id = current_customer.id
    ## @cart_item.save
    #redirect_to cart_items_path
    @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    if @cart_item
      @cart_item.amount += cart_item_params[:amount].to_i
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
    end
    
    
    @cart_item.save
    #redirect_to cart_items_path
    
  end
  
  def destroy_all
    current_customer.cart_item.destroy_all
    redirect_to items_path
  end  
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
