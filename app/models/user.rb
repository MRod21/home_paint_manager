class User < ActiveRecord::Base
  has_many :rooms
  has_secure_password

  validates :username, :password, presence: true
  validates_uniqueness_of :username, :message=>"That username has already been taken, please use another."
end
