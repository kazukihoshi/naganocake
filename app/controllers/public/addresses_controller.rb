class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
    #@address.save
    #redirect_to edit_address_path(current_customer.id)
  end
  
  def create
    address = Address.new
    address.save
    redirect_to edit_address_path(current_customer.id)
  end
  
  private
  
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
  
  
    
  
end
