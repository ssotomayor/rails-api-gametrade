class User < ActiveRecord::Base
  has_secure_password
  has_many :games
  validates :username, uniqueness: { case_sensitive: false }
  validates :token, uniqueness: { case_sensitive: false }
end
