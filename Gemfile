source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'hiredis'
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'active_model_serializers', '~> 0.10.12'
gem 'aws-sdk-s3', require: false
gem 'bcrypt', '~> 3.1.7'
gem 'cancancan'
gem 'devise_token_auth'
gem 'faker', '~> 2.18'
gem 'jwt'
gem 'kaminari'
gem 'omniauth'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'active_storage_validations'
gem 'jsonapi-serializer'
gem 'mini_magick', '>= 4.9.5'
gem 'pg_search'
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'debase', '~> 0.2.4.1'
  gem 'listen', '~> 3.3'
  gem 'ruby-debug-ide', '~> 0.7.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
