class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest
  has_many :projects
  has_many :tasks, through: :task_session
end
