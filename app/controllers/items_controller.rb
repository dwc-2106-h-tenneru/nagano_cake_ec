class ItemsController < ApplicationController
  def index
    @customer = Customer.find(1)
    @items = Item.page(params[:page]).reverse_order
    # @items = Item.order(id: :desc).page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @customer = Customer.find(1)
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
    # @cart = CartItems

  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :is_active, :price, :image_id, :genre_id)
  end



end