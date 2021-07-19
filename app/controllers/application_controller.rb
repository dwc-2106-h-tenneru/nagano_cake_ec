class ApplicationController < ActionController::Base
<<<<<<< HEAD
    
=======
>>>>>>> origin/develop
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
<<<<<<< HEAD
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password])
=======
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:address,:post_code,:phone_number,:is_deleted])
>>>>>>> origin/develop
  end
end
