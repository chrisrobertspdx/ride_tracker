class RenameTypeInBikes < ActiveRecord::Migration
  def change
    rename_column :bikes, :type, :bike_type
  end
end
