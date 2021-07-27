<<<<<<< HEAD
=======
class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_amount = @order.order_details.count
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "製作中"
        @order.status = 2
        @order.update(status: @order.status)
      end
        @count = 0
        @order.order_details.each do |order_detail|
          if  order_detail.making_status_before_type_cast == 3
            @count += 1
          end
        end
      if @count == @order_amount
        @order.update(status: 3)
      end
        redirect_to admin_order_path(@order_detail.order)
        flash[:success] = "製作ステータスを更新しました"
    else
        render :show
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
>>>>>>> origin/develop
