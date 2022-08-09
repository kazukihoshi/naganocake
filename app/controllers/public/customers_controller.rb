class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.all
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    customer = current_customer
    customer.update(current_customer)
    redirect_to customers_my_page(current_customer)
  end  

  def unsubscribe
  end
  
  private
  def customer_params
    params.require(:customer).permit()
  end
  
end
