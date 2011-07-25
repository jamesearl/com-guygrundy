class Blog::TagsController < Blog::BaseController
  def cloud
  	respond_to do |format|
  		format.json {  }
  	end
  end

  def show
  	@tag = Tag.find(params[:id], :include=>:posts)
  	@posts = @tag.posts
  	@page_title = "Posts Tagged ##{@tag.name}"
  end
end
