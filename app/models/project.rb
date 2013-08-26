class Project < ActiveRecord::Base
  attr_accessible :complete?, :title
  belongs_to :user
end
