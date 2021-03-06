class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, unique: true
      t.string :email, unique: true
      t.string :password

      t.timestamps
    end
  end
end
