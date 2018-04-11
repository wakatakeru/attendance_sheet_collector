class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :st_num, :string, unique: true
    add_column :users, :name, :string
    add_column :users, :role, :int
  end
end
