class Cyclist < ActiveRecord::Base
  has_secure_password
  #validates_presence_of :username, :password, :email
  has_many :bikes
  #has_many :rides, through: :bikes
  #include Slugifiable::InstanceMethods
  #extend Slugifiable::ClassMethods
end