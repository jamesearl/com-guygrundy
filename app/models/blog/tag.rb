class Blog::Tag < ActiveRecord::Base
	has_and_belongs_to_many :posts
	
	validates_presence_of :name
	validates_uniqueness_of :name, :case_sensitive=>false
	
end
