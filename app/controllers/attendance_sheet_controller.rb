class AttendanceSheetController < ApplicationController
  def index
  end

  def show
    @sheet = AttendanceSheet.preload(:lesson).find(params[:id])
    @lesson = @sheet.lesson
    @subject = @lesson.subject

    authenticate_sheet_user!(@sheet.user)
  end
  
  def new
    @sheet = AttendanceSheet.new
    @lesson = Lesson.find(url_params[:lesson_id])
    @subject = @lesson.subject
  end

  def create
    @sheet = AttendanceSheet.new(user_params)
    @sheet.user = current_user
    
    if @sheet.save
      redirect_to dashboard_index_path, notice: '提出に成功しました'
    else
      redirect_to dashboard_index_path, alert: '提出に失敗しました'
    end
  end

  def edit
    @sheet = AttendanceSheet.find(params[:id])
    @lesson = @sheet.lesson
    @subject = @lesson.subject

    authenticate_sheet_user!(@sheet.user)
  end

  def update
    @sheet = AttendanceSheet.find(params[:id])

    @sheet.summary = user_params[:summary]
    @sheet.comment = user_params[:comment]
    @sheet.question = user_params[:question]

    authenticate_sheet_user!(@sheet.user)
    
    if @sheet.save
      redirect_to dashboard_index_path, notice: '更新に成功しました'
    else
      redirect_to dashboard_index_path, alert:  '更新に失敗しました'
    end
  end

  private

  def user_params
    params.require(:attendance_sheet).permit(
      :summary,
      :comment,
      :question,
      :lesson_id
    )
  end

  def url_params
    params.permit(:lesson_id)
  end
  
  def authenticate_sheet_user!(user)
    unless current_user == user
      redirect_to dashboard_index_path, alert: '表示権限がありません'
    end
  end
end
