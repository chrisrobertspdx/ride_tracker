class Ride < ActiveRecord::Base
  validates_presence_of :name, :distance
  belongs_to :bike
end