class OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new

  end
# @sta = params[:order][:address].to_i
# # binding.pry
# @order_address = Address.find(@sta)
# @order.post_code = @address.post_code
# @order.address = @order_address.address
# @order.name = @order_address.name

  def confirm
    @order = Order.new
    # @order = Order.confirm(order_params)
    @cart_items = current_customer.cart_items
    @customer = current_customer
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name

    elsif params[:order][:address_option] == "1"
      @order.post_code = Address.post_code
      @order.address = Address.address
      @order.name = Address.name

    elsif params[:order][:address_option] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    # redirect_to orders_confirms_path
    @order.shipping_cost = 800
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # @cart_item.customer_id = current_customer.id
    @order.save
    redirect_to orders_complete_path
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      OrderDetail.create(
        item: cart_item.item,
        order: @order,
        amount: cart_item.amount,
        price: cart_item.item.price
      )
      current_customer.cart_items.destroy_all
    end
  end

  def complete
    @customer = current_customer
  end

  def index
    @customer = current_customer
    @order = Order.find(1)
    @orders = Order.all
    @cart_items = current_customer.cart_items
  end

  def show
  end

  # def confirm
  #   @customer = Customer.find(1)
  #   @cart_item = CartItem.where(customer_id: current_customer.id)
  #   @cart_items = CartItem.all
  #   @order = Order.find(params[:id])
  # end


  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_cost, :total_price, :payment_method, :status)

  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
