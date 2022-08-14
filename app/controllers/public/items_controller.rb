class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
  
end
