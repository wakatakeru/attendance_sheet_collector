class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:st_num, :password)}
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_home_index_path
    else
      home_index_path
    end
  end
end
