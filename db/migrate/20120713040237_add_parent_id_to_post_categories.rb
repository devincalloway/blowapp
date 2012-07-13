class AddParentIdToPostCategories < ActiveRecord::Migration
  def change
    add_column :post_categories, :parent_id, :integer
  end
end
