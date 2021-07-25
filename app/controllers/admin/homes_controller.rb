class Admin::HomesController < ApplicationController
  def top
    @customer = Customer.find(current_customer.id)
    @orders = Order.page(params[:page]).reverse_order
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :status, :amount)
  end

  def order_detail_params
    params.require(:order_detail).permit(:amount, :item_id, :order_id)
  end

end
