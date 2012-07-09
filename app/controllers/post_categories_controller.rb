class PostCategoriesController < InheritedResources::Base
  
# GET /categories
  # GET /categories.xml
  def index
    @post_categories = PostCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_categories }
    end
  end
  
    # GET /categories/new
  # GET /categories/new.xml
  def new
    @post_category = Post_Category.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_category }
    end
  end
  
    # POST /categories
  # POST /categories.xml
  def create
    @post_category = Category.new(params[:post_category])
  
    respond_to do |format|
      if @post_category.save
        format.html { redirect_to(@post_category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @post_category, :status => :created, :location => @post_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_category.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
end
