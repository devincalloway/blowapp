class PostsController < InheritedResources::Base
before_filter :authenticate_user!, :except => [:index, :show]
  # GET /articles
  # GET /articles.xml
  def index
    @posts = Post.published.page(params[:page]).per(5).ordered
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
 
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /articles/1/edit
  def edit
    @post = Post.find(params[:id])
    authorize! :edit, @post
  end

  # POST /articles
  # POST /articles.xml
  def create
    authorize! :create, @post
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @post = Post.find(params[:id])
  authorize! :update, @post
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
  
end