class AddUserIdToAttendanceSheets < ActiveRecord::Migration[5.2]
  def change
    add_column :attendance_sheets, :user_id, :integer
  end
end
