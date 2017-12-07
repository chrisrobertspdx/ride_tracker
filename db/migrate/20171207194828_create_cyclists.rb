class CreateCyclists < ActiveRecord::Migration
  def change
    create_table :cyclists do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :password_digest
    end
  end
end
