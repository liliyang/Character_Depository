class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.string :category
      t.string :picture
      t.string :body

      t.timestamps
    end
  end
end
