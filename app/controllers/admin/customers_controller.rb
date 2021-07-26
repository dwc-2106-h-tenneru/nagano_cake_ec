class Admin::CustomersController < ApplicationController

  #before_action :authenticate_admin!

  def index
  	@customers = Customer.all
  end

	def show
	@customer = Customer.find(params[:id])
	end

	def edit
	@customer = Customer.find(params[:id])
	end

	def update
	@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
		   flash[:success] = "変更完了"
		   redirect_to admin_customer_path
		else
			render "index"
		end
	end

	private
	def customer_params
	  params.require(:customer).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:postal_code,:phone_number,:email,:is_deleted)
	end
end
