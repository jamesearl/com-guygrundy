class Www::BaseController < ApplicationController
  #protect_from_forgery
  before_filter :ensure_domain

  layout 'www'

  def ensure_domain
  	unless request.domain(3).start_with?("www.")
  		redirect_to "http://www.#{request.domain(2)+request.port_string}", :status => 301
  	end
  end

end
