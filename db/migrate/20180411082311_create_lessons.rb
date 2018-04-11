class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.int :week

      t.timestamps
    end
  end
end
