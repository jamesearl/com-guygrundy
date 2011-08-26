class Training::AboutController < Training::BaseController
	
  def index
	@page_title = "About"
  end

  def rates
  	@page_title = "Rates"
  end
end
