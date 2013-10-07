class CreateDragons < ActiveRecord::Migration
  def change
    create_table :dragons do |t|
      t.integer :rider_id
      t.string :name
      t.string :color
      t.integer :age
      t.text :description
      t.text :personality

      t.timestamps
    end
    add_index :dragons, :rider_id
  end  
end
