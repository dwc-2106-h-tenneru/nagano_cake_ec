class Admin::OrdersController < ApplicationController
  def show
     @order = Order.find(params[:id])
     @customer = Customer.find(1)
  end

  def update
     @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admins_order_path(@order)
      flash[:success] = "注文ステータスを更新しました"
    else
      render :show
    end
  end

  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
