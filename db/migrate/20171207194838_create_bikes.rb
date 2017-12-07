class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string = :make
      t.string = :model
      t.string = :type
      t.integer = :frame_size
      t.text = :maintenance_log
    end
  end
end
