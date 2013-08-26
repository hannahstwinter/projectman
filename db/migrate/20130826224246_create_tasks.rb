class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :title
      t.boolean :complete?
      t.integer :completed_by

      t.timestamps
    end
  end
end
