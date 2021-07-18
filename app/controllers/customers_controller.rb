class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    #@custom = Customer
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to 
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :post_code, :phone_number, :email)
  end


end
