class CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.where(customer_id: current_customer.id)
    # @item =
    # @amount = Item.amount
  end

  def create
    @cart_item = CartItem.new(item_id: params[:item_id])
    # @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
      @genres = Genre.all
      @item = Item.find_by(id:@cart_item.item_id)
      redirect_to item_path(@item.id), flash: {alert: '※個数を選択して下さい'}
    end
  end

  def destroy
  end

  def destroy_all
  end

  def update
    @cart_item = CartItem.find(params[:id])
  end

  private


end

