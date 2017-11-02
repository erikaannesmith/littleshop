class User < ApplicationRecord
  validates_presence_of :username, uniqueness: true
  validates_presence_of :password
  has_secure_password
end
