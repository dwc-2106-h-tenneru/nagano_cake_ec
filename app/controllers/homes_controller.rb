class HomesController < ApplicationController
  def top
    @customer = Customer.find(3)
    @items = Item.limit(3).order(" created_at DESC ")
    @genres = Genre.all
  end

  def about
    @customer = Customer.find(3)
  end
end