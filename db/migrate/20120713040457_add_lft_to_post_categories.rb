class AddLftToPostCategories < ActiveRecord::Migration
  def change
    add_column :post_categories, :lft, :integer
  end
end
