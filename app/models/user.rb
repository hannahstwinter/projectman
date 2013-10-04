class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  has_secure_password
  has_many :projects
  has_many :tasks, through: :task_session
  validates_presence_of :email, :name, :password, :on => :create
  validates_uniqueness_of :email
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "address is invalid" }
  before_create {generate_token(:auth_token)}

  def self.authenticate(email)
    find_by_email(email).try(:authenticate, password)
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
