class CartItemsController < ApplicationController
  def index
    # @item =
    # @amount = Item.amount
  end

  def create
    # @cart_item = CartItem.new
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

