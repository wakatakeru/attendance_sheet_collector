class AddSubjectIdToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :subject_id, :integer
  end
end
