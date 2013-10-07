class RemovePetsTable < ActiveRecord::Migration
  def up
    drop_table :pets_tables
  end
  
  def down
    create_table :pets_tables do |t|
      t.string :name
      t.string :pet_type
      t.text :description
      t.text :personality
    end
  end
end
