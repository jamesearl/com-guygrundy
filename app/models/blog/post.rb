class Blog::Post < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :tags
	
	validates_presence_of :title, :body
end
