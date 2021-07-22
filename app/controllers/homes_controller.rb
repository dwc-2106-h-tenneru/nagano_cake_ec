class HomesController < ApplicationController
  def top
    @customer = Customer.find(1)
    @items = Item.limit(3).order(" created_at DESC ")
  end

  def about
    @customer = Customer.find(1)
  end
end