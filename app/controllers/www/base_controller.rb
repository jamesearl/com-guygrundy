class Www::BaseController < ApplicationController
  #protect_from_forgery
  #before_filter :ensure_domain

  APP_DOMAIN = 'guygrundy.com'
  
  layout 'www'

  def ensure_domain
    if request.env['HTTP_HOST'] != APP_DOMAIN and ENV['RAILS_ENV'] != "development"
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end

end
