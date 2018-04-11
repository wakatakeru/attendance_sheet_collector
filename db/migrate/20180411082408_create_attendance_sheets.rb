class CreateAttendanceSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_sheets do |t|
      t.text :comment
      t.text :summary
      t.int :score
      t.text :question

      t.timestamps
    end
  end
end
