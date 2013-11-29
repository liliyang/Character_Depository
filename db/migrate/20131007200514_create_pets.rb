class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :character_id
      t.string :name
      t.string :pet_type
      t.text :description
      t.text :personality

      t.timestamps
    end
    add_index :pets, :character_id
  end  
end
