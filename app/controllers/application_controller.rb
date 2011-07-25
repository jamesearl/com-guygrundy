class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #layout :subdomain_layout
  
  private
  
  def subdomain_layout
  	if request.subdomain.present?
  		"#{request.subdomain}/layouts/application"
  	end
  end
end
