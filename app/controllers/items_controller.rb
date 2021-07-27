class ItemsController < ApplicationController
  before_action :authenticate_customer!,except: [:index, :show]
  
  def index
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    else
      @customer = Customer
    end
    # whereで売り切れ商品は非表示にさせた
    @items = Item.where(is_active: true).page(params[:page]).reverse_order
    # @items = Item.order(id: :desc).page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    else
      @customer = Customer
    end
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