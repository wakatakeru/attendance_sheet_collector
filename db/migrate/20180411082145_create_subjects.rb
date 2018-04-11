class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string  :name
      t.string  :display_name
      t.integer :term
      t.string  :url

      t.timestamps
    end
  end
end
