class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    #p @item.amount
    @item.save
    #redirect_to cart_items_path
  end
  
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :amount)
  end
  
end
