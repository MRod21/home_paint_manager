class User < ActiveRecord::Base
  has_many :rooms
  has_secure_password

  validates :username, :password, presence: true
  validates :username, uniqueness: true
end
