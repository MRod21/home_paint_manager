class User < ActiveRecord::Base
  has_many :rooms
  has_many :paint_colors, through: :rooms
  has_secure_password

  validates :name, :username, :email, presence: true
  validates :email, :username, uniqueness: true
end
