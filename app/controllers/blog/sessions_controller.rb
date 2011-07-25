class Blog::SessionsController < Blog::BaseController
	before_filter :disable_tracking
	
	def new
		@user = Blog::User.new
		@page_title = "Login"
	end

	def create
		return unless check_params
		@user = Blog::User.authenticate(params[:blog_user][:email], params[:blog_user][:password])
		if @user
			reset_session
			
			@user.current_ip = request.remote_ip
			@user.new_auth_token
			@user.save
			
			current_user @user
			flash[:success] = "Welcome back, #{@user.alias || @user.name}"
			redirect_to root_url
		else
			flash[:error] = "Login failed"
			redirect_to login_url
		end
	end

	def destroy
		logout_keeping_session!
		flash[:notice] = "You have logged out."
		redirect_to root_url
	end

	protected

	def check_params
		if params[:blog_user][:email].empty? or params[:blog_user][:password].empty?
			flash[:error] = "Login failed"
			redirect_to :action=>:new
			return false
		end
		true
	end
end
