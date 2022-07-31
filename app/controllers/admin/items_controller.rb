class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:image,:is_active,:genre_id)
  end
  
  
end
