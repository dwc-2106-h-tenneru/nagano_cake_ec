class OdersController < ApplicationController
  def new
    @customer = Customer.find(1)
  end

  def confirm
    @customer = Customer.find(1)
  end

  def create
  end

  def complete
    @customer = Customer.find(1)
  end

  def index
    @customer = Customer.find(1)
  end

  def show
    @customer = Customer.find(1)
  end

  def new
  end

  private


end
