class LessonController < ApplicationController
  before_action :authenticate_admin!  
  before_action :validate_url!, only: [:create]
  
  def new
    @subject_id = url_params[:subject_id]
  end

  def create
    validate_url!
    
    subject_id = Subject.find(user_params[:subject_id]).id
    week_count = user_params[:week_count].to_i

    if insert_lessons(week_count, subject_id)
      redirect_to subject_index_path, notice: "#{week_count}回分の授業登録に成功しました"
    else
      redirect_to subject_index_path, alert: '登録に失敗しました'
    end
    # TODO: activerecord-importでバルクインサートに対応させる
  end

  def show
    # LEFT OUTER JOINでいい感じに書き直す
    @lesson = Lesson.find(params[:id])
    @attendance_sheets = @lesson.attendance_sheets
    @subject = @lesson.subject
    @users = @subject.users
    
    @situations = get_submission_situation(@users, @lesson)
  end

  def edit
    # pending
  end

  def update
    # pending
  end

  private

  def user_params
    params.permit(:week_count, :subject_id)
  end

  def url_params
    params.permit(:subject_id)
  end

  def insert_lessons(week_count, subject_id)
    # TODO: バルクインサートに対応したら削除するメソッド
    lessons = (1..week_count).collect {|week| Lesson.new(week: week, subject_id: subject_id)}

    return false if lessons.map{|l| l.valid?}.include?(false)

    lessons.each {|l| l.save}
    return true
  end

  def authenticate_admin!
    unless current_user.admin?
      redirect_to dashboard_index_path, alert: 'このページへのアクセスは許可されていません'
    end
  end

  def validate_url!
    p redirect_to subject_index_path, alert: '登録に失敗しました' if user_params[:subject_id].empty?
  end

  def get_submission_situation(users, lesson)
    # ActiveRecordのLEFT OUTER JOINでたぶんどうにかできる
    situations = []

    @users = users.preload(:attendance_sheets)
    @lesson_id = lesson.id
    
    users.each do |user|
      situations << {
        st_num: user.st_num,
        name: user.name,
        submitted: user.attendance_sheets.where(lesson_id: @lesson_id).present?,
        attendance_sheet: user.attendance_sheets.where(lesson_id: @lesson_id).first
      }
    end

    situations
  end
end
