class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :pronunciation
      t.string :type
      t.string :rank
      t.integer :age
      t.string :gender
      t.string :location
      t.text :description
      t.text :personality
      t.text :history
      t.date :birthdate
      t.integer :pets
      t.boolean :rider
      t.boolean :candidate
      t.boolean :crafter
      t.boolean :holder

      t.timestamps
    end
  end
end
