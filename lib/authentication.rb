module Authentication
	protected
	
	def load_current_user
		@current_user ||= login_from_session || login_from_cookie || false # login_from_cookie
		if !@current_user
			def @current_user.is_admin?; false; end
		end
	end
	
	def in_role?(role_name)
		load_current_user
		@current_user.in_role?(role_name)
	end
	
	def is_admin?
		@current_user && @current_user.is_admin
	end
	
	def current_user(user)
		@current_user = user
		session[:user_id] = user.id
		cookies[:auth_token] = user.auth_token
		#puts "Cookies[auth_token] = #{cookies[:auth_token]}"
		#puts "Current user ID: #{user.id}"
	end
	
	def login_from_cookie()
		user = cookies[:auth_token] && Blog::User.exists?({:auth_token=>cookies[:auth_token]}) && Blog::User.find_by_auth_token(cookies[:auth_token])
		if user && user.auth_token?
			if user.current_ip != request.remote_ip
				user = nil
			else
				current_user user
			end
		end
		user
	end
	
	def login_from_session()
		user = session[:user_id] && Blog::User.exists?(session[:user_id]) && Blog::User.find(session[:user_id])
		if user
			if user.current_ip != request.remote_ip
				#login fail
				user = nil
			else
				current_user user
			end
		end
		user
	end
	
	# This is ususally what you want; resetting the session willy-nilly wreaks
	# havoc with forgery protection, and is only strictly necessary on login.
	# However, **all session state variables should be unset here**.
	def logout_keeping_session!
		@current_user.forget_me! if @current_user.is_a? Blog::User
		@current_user = false     # not logged in, and don't do it for me
		session[:user_id] = nil   # keeps the session but kill our variable
		cookies[:auth_token] = nil
	end

end
