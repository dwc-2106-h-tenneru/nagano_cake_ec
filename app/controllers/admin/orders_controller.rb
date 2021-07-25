class Admin::OrdersController < ApplicationController
  def show
     @order = Order.find(params[:id])
     @customer = Customer.find(1)
     @order.shipping_cost = 800
     @order_details = @order.order_details
  end

  def update
     @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
      flash[:success] = "注文ステータスを更新しました"
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:status, :price, :shipping_cost, :customer_id)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status, :amount, :price, :item_id, :order_id)
  end

end
