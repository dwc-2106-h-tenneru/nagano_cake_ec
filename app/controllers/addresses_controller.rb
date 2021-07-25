class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
    @customer = Customer.find(current_customer.id)
  end


  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
    @customer = Customer.find
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

   private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end
