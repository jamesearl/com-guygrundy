require 'digest/sha1'

class Blog::User < ActiveRecord::Base
	has_many :posts

	validates_presence_of :name
	validates_presence_of :password
	validates_presence_of :email
	validates_uniqueness_of :email, :case_sensitive=>:false, :message=>"already registered"
	
	attr_protected :is_admin
	attr_accessor :password_confirm
	
	def set_password(ct_pass)
		self.salt = make_token
		self.password = secure_digest(ct_pass, self.salt)
		self
	end
	
	def new_auth_token()
		self.auth_token = make_token
		self
	end
	
	def self.authenticate(try_email, try_password)
    return nil if try_email.blank? || try_password.blank?
		u = find_by_email(try_email.downcase)
		u && u.authenticated?(try_password) ? u : nil
  end
  
  def authenticated?(try_password)
		return if try_password.blank?
		password==secure_digest(try_password, salt)
	end
	
	def forget_me!
		self.auth_token = self.current_ip = nil
		self.save
		self
	end
	
	protected
		
		def secure_digest(*args)
			Digest::SHA1.hexdigest(args.flatten.join)
		end
		
		def make_token
			secure_digest(Time.now, (1..10).map{ rand.to_s })
		end
		

end
