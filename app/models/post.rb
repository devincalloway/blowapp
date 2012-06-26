class Post < ActiveRecord::Base

 
  attr_accessible :body, :title, :user_id, :published
  belongs_to :user
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  validates_numericality_of :user_id

  
  scope :published, lambda { {:conditions => ['published = ?', true]} }
  scope :ordered, lambda {{:order => "Created_at DESC" }}
end
