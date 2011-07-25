class Blog::UsersController < Blog::BaseController
	before_filter :find_user
	
	def posts
		@posts = @user.posts
		@page_title = "Posts by user #{@user.alias}"
	end
	
	protected
	
	def find_user
		@user = Blog::User.find(params[:id])
	end
end
