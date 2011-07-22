ComGuygrundy::Application.routes.draw do
	
	namespace "www" do
		constraints :subdomain => "www" do
			
		end
	end
	
	namespace "blog" do
		constraints :subdomain => "blog" do
			
		end
	end
	
	namespace "training" do
		constraints :subdomain => "training" do
			
		end
	end
	
end
