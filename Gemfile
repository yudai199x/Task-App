source 'https://rubygems.org'

ruby '2.7.6'

gem 'rails',        '~> 5.1.6'
gem 'devise'
gem 'omniauth-line'
gem 'omniauth-rails_csrf_protection'
gem 'dotenv-rails'
gem 'bootstrap-sass'
gem 'rails-i18n'
gem 'devise-i18n'
gem 'nested_form_fields'
gem 'chartkick'
gem 'lazy_high_charts'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'puma',         '~> 3.7'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
# Mac環境でもこのままでOKです
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]