class UserController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  end

  private 
  
  def authenticate_admin!
    unless current_user.admin?
      redirect_to dashboard_index_path, alert: 'このページへのアクセスは許可されていません'
    end
  end
end