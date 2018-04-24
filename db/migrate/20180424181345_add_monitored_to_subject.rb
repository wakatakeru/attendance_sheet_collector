class AddMonitoredToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :monitored, :boolean, default: false, null: false
  end
end
