class Video < ActiveRecord::Base
  attr_accessible :body, :category_id, :slug, :title, :url, :user_id
end
