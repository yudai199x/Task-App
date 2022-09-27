class CreateMiniTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :mini_tasks do |t|
      t.string :dtl
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
