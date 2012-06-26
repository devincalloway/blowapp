class AddUserIdToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :user_id, :null => false, :options =>
      "CONSTRAINT fk_post_users REFERENCES users(id)"
    end
  end

  def self.down
    remove_column :posts, :user_id
  end
end