class PostCategory < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :posts
  acts_as_nested_set
  attr_accessible :name, :parent_id
end
