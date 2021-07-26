class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:address,:post_code,:phone_number,:is_deleted])

  end

 private
  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_items_path
      elsif resource_or_scope.is_a?(Customer)
        root_path
      else
        root_path
      end
  end

  def
  after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :customer
        root_path
      elsif resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
  end

  #def after_sign_in_path_for(resource)
   # if  customers_singed_in?
    #  root_path(resource)
    #else
     # admin_customers_path
    #end
#  end

end