class Dashboard::AdminController < ApplicationController
  before_action :authenticate_admin!

  def index
    @subjects = Subject.where(monitored: true).preload(:lessons).sort {|s1, s2| s1.term <=> s2.term}
  end

  def show
    @subject = Subject.find(params['subject_id'])
    @lessons = @subject.lessons.sort {|l1, l2| l1.week <=> l2.week }
    @situations = get_submission_situation(@subject, @lessons)
  end

  private
  
  def authenticate_admin!
    unless current_user.admin?
      redirect_to dashboard_index_path, alert: 'このページへのアクセスは許可されていません'
    end
  end

  def get_submission_situation(subject, lessons)
    # ActiveRecordのLEFT OUTER JOINでたぶんどうにかできる
    situations = []

    @users = subject.users.preload(:attendance_sheets)
    @lessons = @lessons

    @users.each do |user|
      situation = {st_num: user.st_num, name: user.name, statuses: []}

      @lessons.each do |lesson|
        lesson_id = lesson.id
        situation[:statuses] << {
          submitted: user.attendance_sheets.where(lesson_id: lesson_id).present?,
          attendance_sheet: user.attendance_sheets.where(lesson_id: lesson_id).first
        }
      end

      situations << situation
    end

    situations
  end
end
