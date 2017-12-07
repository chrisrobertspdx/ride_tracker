class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.float :distance_miles
      t.integer :climbing_feet
      t.string :terrain
      t.date :ride_date
      t.float :duration_hours
    end
  end
end
