source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'turbolinks'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem "font-awesome-rails"
gem 'mandrill-api' # for sending emails
gem 'figaro' # for environment variables

gem 'devise'
gem 'gravtastic'
gem 'paperclip'
group :development do
  gem 'jbuilder', '~> 1.2'
  gem 'pry-rails'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :production do
	gem 'pg'
  gem 'rails_12factor' # heroku asset pipeline
end

group :doc do
  gem 'sdoc', require: false
end



# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
