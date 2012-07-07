class Page < ActiveRecord::Base
  attr_accessible :body, :title
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
end
