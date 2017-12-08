class AddColToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :cyclist_id, :integer
  end
end
quit