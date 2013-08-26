class Task < ActiveRecord::Base
  attr_accessible :complete?, :completed_by, :title
  belongs_to :project
  has_many :users, through: :task_session
end
