class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :character_id
      t.integer :relative_id
      t.string :relation_type
      t.timestamps
    end
  end
end
