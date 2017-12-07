class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string = :name
      t.float = :distance
      t.integer = :climbing_feet
      t.string = :type
      t.date = :ride_date
    end
  end
end
