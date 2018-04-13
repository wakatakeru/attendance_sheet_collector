class SubjectController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @subject = Subject.all
  end

  def show
    @subject = Subject.find(params['id'])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(user_params)

    @subject.users << current_user
    
    if @subject.save
      redirect_to admin_home_index_path
    else
      render 'new'
    end
  end
  
  def edit
    @subject = Subject.find(params['id'])
  end

  def update
    @subject = Subject.find(params['id'])

    @subject.name = user_params[:name]
    @subject.display_name = user_params[:display_name]
    @subject.term = user_params[:term]
    @subject.url = user_params[:url]
    
    if @subject.save
      redirect_to admin_home_index_path
    else
      redirect_to admin_home_index_path
    end
  end
  
  private

  def user_params
    params.require(:subject).permit(
      :name,
      :display_name,
      :term,
      :url
    )
  end

  def authenticate_admin!
    unless current_user.admin?
      redirect_to home_index_path, alert: 'このページへのアクセスは許可されていません'
    end
  end
end
