class CustomersController < ApplicationController
  def show
    @customer = Customer.find(1)
  end

  def edit
    @customer = Customer.find(1)
  end

  def update
    @customer = Customer.find(1)
    @customer.update(customer_params)
    redirect_to
  end

  def unsubscribe
    @customer = Customer.find(1)
  end

  def withdraw
    @customer = cCustomer.find(1)
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :post_code, :phone_number, :email)
  end

end