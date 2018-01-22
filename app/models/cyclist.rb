class Cyclist < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil: true
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :bikes
  has_many :rides, through: :bikes
end