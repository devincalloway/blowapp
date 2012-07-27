class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.text :body
      t.string :slug
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
