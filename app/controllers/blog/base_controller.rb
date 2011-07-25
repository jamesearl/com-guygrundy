class Blog::BaseController < ApplicationController
  protect_from_forgery
  include Authentication
  include Authorization
  
  layout 'blog'
  
	before_filter :load_current_user
	before_filter :set_tracking
	#before_filter :set_flash
	
	def set_tracking
		@show_tracking = true
	end
	def disable_tracking
		@show_tracking = false
	end
	
	def set_flash
		flash[:notice] = "flash[:notice] some text, biatch"
	end
end
