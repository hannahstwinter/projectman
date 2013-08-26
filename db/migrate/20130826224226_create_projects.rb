class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :user
      t.string :title
      t.boolean :complete?

      t.timestamps
    end
  end
end
