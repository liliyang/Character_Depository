class CreateClutches < ActiveRecord::Migration
  def change
    create_table :clutches do |t|
      t.string :dame
      t.string :sire
      t.date :date_clutched
      t.date :date_hatched
      t.string :theme
      t.integer :user_id
      t.timestamps
    end
    add_index :clutches, :user_id
  end
end
