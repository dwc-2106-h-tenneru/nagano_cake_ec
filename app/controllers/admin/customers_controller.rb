class Admin::CustomersController < ApplicationController
 
  before_action :authenticate_admin!

    def index
    @Customers = Customer.all.page(params[:page]).per(10)
	end

	def show
	@Customer = Customer.find(params[:id])
	end

	def edit
	@Customer = Customer.find(params[:id])
	end

	def update
	@Customer = Customer.find(params[:id])
		if @Customer.update(customer_params)
		   flash[:success] = "会員情報を変更しました"
		   redirect_to admin_customer_path
		else
			render "index"
		end

	end

	private
	def customer_params
	  params.require(:customer).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:postal_code,:residence,:phone_number,:email,:is_valid)
	end
end
