require 'securerandom'

class Session < ActiveRecord::Base
  attr_accessor :email, :password

  belongs_to :user

  validates :user, presence: true
  validates :cookie_hash, presence: true

  before_save do
    if self.email && self.password
      self.user = User.login(self.email, self.password)
    end

    self.cookie_hash = SecureRandom.base64
  end
end
