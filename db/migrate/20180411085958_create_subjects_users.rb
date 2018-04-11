class CreateSubjectsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects_users do |t|
      t.integer :subject_id
      t.integer :user_id
    end
  end
end
