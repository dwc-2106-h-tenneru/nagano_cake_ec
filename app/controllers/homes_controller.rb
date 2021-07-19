class HomesController < ApplicationController
  def top
    @customer = Customer.find(1)
  end

  def about
    @customer = Customer.find()
  end
end