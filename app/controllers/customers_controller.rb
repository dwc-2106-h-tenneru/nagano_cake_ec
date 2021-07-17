class CustomersController < ApplicationController
  def show
    @customer = Customer.all
  end

end
