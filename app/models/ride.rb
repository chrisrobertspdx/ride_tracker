class Ride < ActiveRecord::Base
  #validates_presence_of :name, :distance_miles
  belongs_to :bike
  #has_one :cyclist
end