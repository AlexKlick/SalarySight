source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.6'
# gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'mini_magick', '~> 4.8'
# gem 'capistrano-rails', group: :development

gem 'bootsnap', '>= 1.1.0', require: false

gem 'factory_bot_rails'
gem 'faker'
gem 'faraday'
gem 'figaro'
gem 'graphql'
gem 'rack-cors'

group :development, :test do
  gem 'graphiql-rails'
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov'
  # gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
