class HomesController < ApplicationController
  def top
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    else
      @customer = Customer
    end
    @items = Item.limit(3).order(" created_at DESC ")
    @genres = Genre.all
  end

  def about
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    else
      @customer = Customer
    end
  end
end