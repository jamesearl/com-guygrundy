class Blog::PostsController < Blog::BaseController
	before_filter :requires_admin, :except=>[:show, :index, :index_page, :rss, :list]
	before_filter :get_post, :except=>[:index, :index_page, :create, :new, :rss]
	before_filter :disable_tracking, :except=>[:show, :index, :index_page, :rss, :list]
	
	POSTS_PER_PAGE = 5
	
	def rss
		@posts = Blog::Post.limit(5).order("created_at DESC")
	end
	
	def index
		if @current_user && @current_user.is_admin
			@posts = Blog::Post.limit(5).includes(:tags, :user).order("created_at DESC")
		else
			@posts = Blog::Post.where(:published=>true).order("created_at DESC").limit(5).includes(:tags, :user)
		end
		@page_title = "Home"
		render 'list'
	end
	
	def list
		#nothing todo here, @posts should already be setup
	end
	
	def index_page
		if @current_user && @current_user.is_admin
			@posts = Blog::Post.offset(params[:page].to_i*POSTS_PER_PAGE).limit(POSTS_PER_PAGE).includes(:tags, :user).order("created_at DESC")
		else
			@posts = Blog::Post.where(:published=>true).order("created_at DESC").offset(params[:page].to_i*POSTS_PER_PAGE).limit(POSTS_PER_PAGE).includes(:tags, :user)
		end
		@page_title = "Home - Page #{params[:page].to_i}"
		render 'list'
	end
	
	def create
		return unless @current_user && @current_user.is_admin
		@post = Blog::Post.new(params[:blog_post])
		@post.user = @current_user
		respond_to do |format|
			if @post.save
				format.html { redirect_to blog_post_slug_url(:id=>@post.id, :slug=>@post.slug), :notice=> "Post successfully created." }
			else
				format.html {render :action=>"new"}
			end
		end
	end
	
	def new
		return unless @current_user && @current_user.is_admin
		@post = Blog::Post.new
	end
	
	def edit
	end
	
	def show
	end
	
	def update
		return unless @current_user && @current_user.is_admin
		respond_to do |format|
			if @post.update_attributes(params[:blog_post])
				format.html {redirect_to edit_post_url(@post), :notice=> "Post successfully updated."}
			else
				format.html {render :action=>"edit"}
			end
		end
	end
	
	def destroy
	end
	
	def update_title
		return unless @current_user && @current_user.is_admin
		@post.title = params[:value]
		@post.save
		
		respond_to do |format|
			format.json {render :json=>@post.title}
		#	format.html {redirect_to @post, :notice=>"Post successfully update."}
		end
	end
	
	protected
	def get_post
		@post = Blog::Post.find(params[:id], :include=>[:tags, :user])
		#check that the provided slug matches the post's slug, perma redirect if not
		#EXCEPT IF HEADING TO EDIT!
		if params[:slug]!=nil && params[:slug]!=@post.slug
			redirect_to url_for(:controller=>'posts', :action=>'show', :id=>@post.id, :slug=>@post.slug), :status=>301
		end
		@page_title = @post.title
	end
	
end
