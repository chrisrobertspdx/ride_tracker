class AddColsToRides < ActiveRecord::Migration
  def change
    add_column :rides, :bike_id, :integer
  end
end
