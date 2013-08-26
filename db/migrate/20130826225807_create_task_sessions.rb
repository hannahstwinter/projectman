class CreateTaskSessions < ActiveRecord::Migration
  def change
    create_table :task_sessions do |t|
      t.belongs_to :task
      t.belongs_to :user
      t.datetime :ended_at

      t.timestamps
    end
  end
end
