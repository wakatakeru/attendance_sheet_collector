class AdminHomeController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def authenticate_admin!
    unless current_user.admin?
      redirect_to home_index_path, alert: 'このページへのアクセスは許可されていません'
    end
  end
end
