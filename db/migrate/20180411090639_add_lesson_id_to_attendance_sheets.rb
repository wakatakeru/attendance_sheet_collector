class AddLessonIdToAttendanceSheets < ActiveRecord::Migration[5.2]
  def change
    add_column :attendance_sheets, :lesson_id, :integer
  end
end
