class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def unsubscribe
  end
  
  private
  def customer_params
    params.require(:customer).permit()
  end
  
end
