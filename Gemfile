source 'http://rubygems.org'

gem 'rails', '3.0.7'
gem 'rake'#, '~> 0.8.7'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# gem 'aws-s3', :require => 'aws/s3'

group :production do
	gem 'pg'
end

group :development, :test do
   gem 'sqlite3'
   gem 'sqlite3-ruby', :require => 'sqlite3'
   gem 'heroku'
   gem 'taps'
end
