class Training::AboutController < Training::BaseController
	
  def index
	@page_title = "About"
  end

  def rates
  	@page_title = "Rates"
  end

  def consulting
  	@page_title = "Consulting"
  end

  def news
    @page_title = "News"
  end
end
