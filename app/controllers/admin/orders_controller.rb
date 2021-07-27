class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
     @order = Order.find(params[:id])
     @customer = @order.customer
     @order.shipping_cost = 800
     @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.status == "入金確認"
        @order.order_details.each do |order_detail|
          order_detail.update(making_status: 1)
        end
        redirect_to admin_order_path(@order)
      flash[:success] = "注文ステータスを更新しました"
      else
        redirect_to admin_order_path(@order)
        flash[:success] = "注文ステータスを更新しました"
      end
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