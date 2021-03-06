class OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
  end

  def confirm
    @order = Order.new
    # @order = Order.confirm(order_params)
    @cart_items = current_customer.cart_items
    @customer = Customer.find(current_customer.id)
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name

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
        price: cart_item.item.add_tax_price
      )
      current_customer.cart_items.destroy_all
    end
  end

  def complete
    @customer = Customer.find(current_customer.id)
  end

  def index
    @orders = current_customer.orders.page(params[:page]).reverse_order.order("id DESC")
    # @orders = Order.page(params[:page]).reverse_order
    @customer = Customer.find(current_customer.id)

    # @order = Order.find(order_params)
    # @cart_items = current_customer.cart_items
  end

  def show
    @orders = current_customer.orders.page(params[:page]).reverse_order.order("id DESC")
    @order = Order.find(params[:id])
    @customer = Customer.find(current_customer.id)
    @order.shipping_cost = 800
    @order_details = @order.order_details
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_cost, :total_price, :payment_method, :status)

  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

  def address_params
    params.require(:order).permit(:post_code, :address, :name)

  end

end