class HomesController < ApplicationController
  def top
    @customer = current_customer
  end

  def about
    @customer = current_customer
  end
end