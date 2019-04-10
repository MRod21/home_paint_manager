class User < ActiveRecord::Base
  has_many :rooms
  has_many :paint_colors, through: :rooms
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
