class AddChkToMiniTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :mini_tasks, :cpl_chk, :boolean
  end
end
