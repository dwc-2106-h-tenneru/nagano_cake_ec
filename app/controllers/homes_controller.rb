class HomesController < ApplicationController
  def top
    @customer = Customer.find(current_customer.id)
    @items = Item.limit(3).order(" created_at DESC ")
    @genres = Genre.all
  end

  def about
    @customer = Customer.find(current_customer.id)
  end
end