class SubjectController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @subjects = Subject.preload(:lessons).sort {|s1, s2| s1.term <=> s2.term}
  end

  def show
    @subject = Subject.find(params['id'])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(user_params)
    p @week_count = week_count_params
    
    @subject.users << current_user
    
    if @subject.save
      redirect_to subject_index_path, notice: '新規登録に成功しました'
    else
      render 'new', alert: '新規登録に失敗しました'
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
      redirect_to subject_index_path, notice: '更新に成功しました'
    else
      redirect_to subject_index_path, alert:  '更新に失敗しました'
    end
  end
  
  private

  def user_params
    params.require(:subject).permit(
      :name,
      :display_name,
      :term,
      :url,
    )
  end

  def week_count_params
    params.require(:subject).permit(
      :week_count
    )
  end
  
  def authenticate_admin!
    unless current_user.admin?
      redirect_to dashboard_index_path, alert: 'このページへのアクセスは許可されていません'
    end
  end
end
