class AddAuthzAndResetToUsers < ActiveRecord::Migration
  def up
    add_column :users, :authz, :string
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datetime
  end
  def down
    remove_column :users, :authz, :string
    remove_column :users, :password_reset_token, :string
    remove_column :users, :password_reset_sent_at, :datetime
  end
end
