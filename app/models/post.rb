class Post < ActiveRecord::Base

 
  attr_accessible :body, :title, :user_id, :published, :tag_list, :tag_tokens, :tag_posts
  belongs_to :user
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  validates_numericality_of :user_id
  
  scope :published, lambda { {:conditions => ['published = ?', true]} }
  scope :ordered, lambda {{:order => "Created_at DESC" }}
  
  acts_as_taggable_on :tags # Tagging
  attr_reader :tag_tokens

  def self.tag_post_list(page, tag)

  @posts = Post.tagged_with(params[:id]).paginate(:page => params[:page], :per_page => 10)

end

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
