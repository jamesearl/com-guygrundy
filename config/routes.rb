ComGuygrundy::Application.routes.draw do
	
  get "resume/index"

	scope :www, :constraints => {:subdomain => 'www'} do
	
		match '/about' 			=> 'www/about#index'
		match '/news' 			=> 'www/news#index'
		match '/reel' 			=> 'www/reel#index', :via=>:get, :as=>:reel
		match '/biography' 	=> 'www/biography#index'
		match '/resume' 		=> 'www/resume#index'
		match '/photos' 		=> 'www/photos#index'
		match '/contact' 		=> 'www/contact#index'
	
	end
	
	scope :blog, :constraints => {:subdomain=> 'blog'} do
		#POSTS
		match '/posts' 									=> 'blog/posts#index', 				:via=>:get, 	:as=>:blog_posts
		match '/posts/page/:page'				=> 'blog/posts#index_page',		:via=>:get,		:as=>:posts_page, :constraints => {:page => /\d+/}
		match '/posts' 									=> 'blog/posts#create', 				:via=>:post
		match '/rss' 										=> "blog/posts#rss", 												:as=>:rss
		match '/posts/new' 							=> 'blog/posts#new', 					:via=>:get
		match '/posts/:id/edit' 				=> 'blog/posts#edit',  				:via=>:get, 	:as=>:edit_post, 	:constraints => {:id => /\d+/}
		match '/posts/:id/*slug'				=> 'blog/posts#show', 					:via=>:get, 	:as=>:blog_post_slug, 	:constraints => {:id => /\d+/}
		match '/posts/:id'							=> 'blog/posts#show',					:via=>:get,		:as=>:blog_post, 			:constraints => {:id => /\d+/}
		match '/posts/:id' 							=> 'blog/posts#update',  			:via=>:put, 										:constraints => {:id => /\d+/}
		match '/posts/:id' 							=> 'blog/posts#destroy', 			:via=>:delete, 									:constraints => {:id => /\d+/}
		#match 'posts/:id/edit/title'	=> 'blog/posts#update_title', 	:via=>:post
		#match 'posts/:id/edit/body'		=> 'blog/posts#update_body', 	:via=>:post
		
		#TAGS
		match '/tags/:id/:name'	=> 'blog/tags#show',	:via=>:get,	:as=>:tag
	
		#USERS
		match '/posts/user/:id' => 'blog/users#posts',	:via=>:get,	:as=>:user_posts
	
		
		#SESSIONS
		match '/login' 		=> 'blog/sessions#new', 											:as => :login
		match '/logout' 	=> 'blog/sessions#destroy', 									:as => :logout
		match '/sessions' => 'blog/sessions#create',		:via=>:post
 	
	end
	
	scope :training, :constraints => {:subdomain=>'training'} do
		
		match '/biography' 	=> 'training/biography#index'
		match '/contact' 		=> 'training/contact#index'
		match '/about' 			=> 'training/about#index'
	end
	
	root :to => 'www/about#index', :constraints => { :subdomain => 'www' }
	root :to => 'blog/posts#index', :constraints => { :subdomain => 'blog' }
	root :to => 'training/about#index', :constraints => { :subdomain => 'training' }
	
	#root :to => redirect {|p, req| "www.#{req.domain(2)}" }
	root :to => 'www/about#index'
	
	
	
	
end
