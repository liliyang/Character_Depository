class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :post_body
      t.boolean :reveal
      t.integer :clutch_id

      t.timestamps
    end
    add_index :posts, :clutch_id
  end
end
