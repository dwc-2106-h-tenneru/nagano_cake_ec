class Admin::CustomersController < ApplicationController

  #before_action :authenticate_admin!

<<<<<<< HEAD
    def index
     @Customers = Customer.all

    end
=======
  def index
  	@Customers = Customer.all
  end
>>>>>>> origin/develop

	def show
	@Customer = Customer.find(params[:id])
	@Customer.is_deleted = false
	end

	def edit
	@Customer = Customer.find(params[:id])
	end

	def update
	@Customer = Customer.find(params[:id])
		if @Customer.update(customer_params)
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
