class Admin::HomesController < ApplicationController
  def top
    @customer = current_customer
    @orders = Order.page(params[:page]).reverse_order
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :status)
  end
  
  
end
