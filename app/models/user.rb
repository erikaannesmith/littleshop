class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password, presence: true
  validates_uniqueness_of :username 
  enum role: ["default", "admin"]
end
