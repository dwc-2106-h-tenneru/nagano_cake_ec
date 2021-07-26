class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "製作中"
        @order.status = 2
        @order.update(status: @order.status)
      elsif @order_details.making_status == @order.order_details.where(making_status: "製作完了")
        @order.status = 3
        @order.update(status: @order.status)
      end
        redirect_to admin_order_path(@order_detail.order)
        flash[:success] = "製作ステータスを更新しました"
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

  def order_params
    params.require(:order).permit(:status, :price, :shipping_cost, :customer_id)
  end

end
