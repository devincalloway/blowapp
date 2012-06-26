class AddCreatedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :created_at, :datetime
  end
end
