class AddRgtToPostCategories < ActiveRecord::Migration
  def change
    add_column :post_categories, :rgt, :integer
  end
end
