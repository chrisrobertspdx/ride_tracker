class Bike < ActiveRecord::Base
  validates_presence_of :make, :model
  belongs_to :cyclist
  has_many :rides
end