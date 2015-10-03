class User < ActiveRecord::Base
  has_secure_password

  validates :name, uniqueness: {lowercase: false}, presence: true
  validates :email, uniqueness: {lowercase: false}, presence: true

  def self.login email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
