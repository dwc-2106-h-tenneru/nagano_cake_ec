class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    # @item = Item.find(params[:id])
    @customer = Customer.find(current_customer.id)
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @cart_items = CartItem.all
    # @subtotal　= cart_item.item.price * cart_item.amount
    # @item =
    # @amount = Item.amount
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    # @cart_items = current_user.cart_items.all
    if @cart_item.save
      redirect_to cart_items_path
    else
      # session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
      @genres = Genre.all
      @item = Item.find_by(@cart_item.item_id)
      redirect_to item_path(@item.id), flash: {alert: '※注文し直せ'}
    end
  end

  def destroy
    @customer = Customer.find(current_customer.id)
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def update
    # @cart_item = CartItem.where(customer_id: current_customer.id)
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    # @cart_item.update(amount: params[:amount].to_i)
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end

