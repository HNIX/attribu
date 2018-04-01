source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.1'
gem 'rails', '~> 5.1.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'milia', github: 'jekuno/milia', branch: 'issue#76'
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'figaro'
gem 'aws-sdk'
gem 'stripe'
gem 'simple-line-icons-rails'
gem 'material_icons'
gem "font-awesome-rails"
gem 'shortener'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'hub', :require=>nil
  gem 'rails_layout'
end

group :production do
  gem 'rails_12factor'
end

gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
