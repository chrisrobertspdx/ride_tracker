class Cyclist < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  #validates_presence_of :password, :message => "Password cannot be blank."
  has_many :bikes
  has_many :rides, through: :bikes
  #include Slugifiable::InstanceMethods
  #extend Slugifiable::ClassMethods
end