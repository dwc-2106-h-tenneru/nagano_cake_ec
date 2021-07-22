class CartItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    # @item = Item.find(params[:id])
    @customer = Customer.find(1)
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @cart_items = CartItem.all
    # @subtotal　= cart_item.item.price * cart_item.amount
    # @item =
    # @amount = Item.amount
  end

  # def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   @cart_item.customer_id = current_customer.id
  #   # @cart_items = current_user.cart_items.all
  #   @cart_item.save
  #   @cart_items = current_customer.cart_items.all
  #   @cart_items.each do |cart_item|
  #       @order_details_items = @order_details.order_details_items.new
  #       @order_details_items.item_id = cart_item.item.id
  #       @order_details_items.name = cart_item.item.name
  #       @order_details_items.price = cart_item.item.price
  #       @order_details_items.quantity = cart_item.quantity
  #       @order_details_items.save
  #     redirect_to cart_items_path
  #     current_user.cart_items.destroy_all

  #   end
  # end

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
    @customer = Customer.find(1)
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
    @cart_items = CartItem.all
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_item.destroy
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

