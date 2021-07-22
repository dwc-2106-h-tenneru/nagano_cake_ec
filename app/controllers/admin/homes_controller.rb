class Admin::HomesController < ApplicationController
  def top
    @customer = Customer.find(1)
    @orders = Order.page(params[:page]).reverse_order
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :status)
  end
  
  
end
