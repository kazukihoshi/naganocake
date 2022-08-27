class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @OrderDetails.all
    @prdetail.update(order_detail_params)
    redirect_to admin_order_path(@order.id)
  end
  
  priveta
  def order_detail_params
    params.require(:order_detail).permit(:is_active)
  end
  
end
