class Post < ActiveRecord::Base
  belongs_to :post_category
  #Friendly ID
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
 
  #def shoud_generate_new_friendly_id?
   # new_record?
  #end
 
  attr_accessible :body, :title, :user_id, :published, :tag_list, :tag_tokens, :category_id, :parent_id
  belongs_to :user
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  validates_numericality_of :user_id

  
  scope :published, lambda { {:conditions => ['published = ?', true]} }
  scope :ordered, lambda {{:order => "Created_at DESC" }}
  
  acts_as_taggable_on :tags # Tagging p
  attr_reader :tag_tokens
  
  def tag_tokens=(ids)
    tags = ids.split(",")
    #Holder for existing tag ids
    finder = []
    #Holder for new tag strings
    r_tags = []
    for tag in tags
      if tag.to_i > 0
        finder << tag
      else
        r_tags << tag.delete("'")
      end
    end
    #Find existing tags from integer ids
    r_tags += ActsAsTaggableOn::Tag.select(:name).find(finder).collect(&:name)
    self.tag_list = r_tags
  end
end