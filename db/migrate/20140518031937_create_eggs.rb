class CreateEggs < ActiveRecord::Migration
  def change
    create_table :eggs do |t|
      t.string :name
      t.text :description
      t.string :creature_color
      t.text :creature_appearance
      t.text :creature_personality
      t.string :character
      t.string :inspiration
      t.integer :clutch_id
      t.timestamps
    end
    add_index :eggs, :clutch_id
  end
end
