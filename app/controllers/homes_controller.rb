class HomesController < ApplicationController
  def top
    @customer = current_customer
    @items = Item.limit(3).order(" created_at DESC ")
  end

  def about
    @customer = current_customer
  end
end