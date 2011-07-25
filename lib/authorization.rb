module Authorization
	protected
	
	def requires_admin
		return if is_admin?
		redirect_to root_url
		#requires_role("admin")
	end
	
	#def requires_role(role_name)
		#return if in_role?(role_name)
		#redirect_to root_url
	#end

end
