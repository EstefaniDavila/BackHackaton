source 'https://rubygems.org'

ruby '3.3.3'

# Framework principal
gem 'rails', '~> 7.1.6'

# Base de datos
gem 'pg', '~> 1.1'

# Servidor web
gem 'puma', '>= 5.0'

# Sistema de assets
gem 'sprockets-rails'

# Turbo + Stimulus
gem 'stimulus-rails'
gem 'turbo-rails'

# Seguridad / autenticación
gem 'api_guard'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'

# Autorización / paginación / filtros
gem 'kaminari'
gem 'pundit'
gem 'ransack'

# API / respuestas / requests
gem 'base64', '0.1.1'
gem 'dry-initializer'
gem 'faraday'
gem 'faraday-retry'
gem 'rack-cors', require: 'rack/cors'
gem 'responders'
gem 'useragent'

# Background jobs
gem 'redis', '~> 4.0'
gem 'sidekiq'

# Archivos, imágenes y PDFs
gem 'aws-sdk-s3', '~> 1'
gem 'carrierwave', '>= 3.0.0.beta', '< 4.0'
gem 'image_processing', '~> 1.2'
gem 'mini_magick'
gem 'rmagick'
gem 'wicked_pdf'

# Utilidades
gem 'bootsnap', require: false
gem 'dotenv-rails', groups: %i[development test]
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
end

group :development do
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0', require: false
  gem 'rufo'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem 'rubocop-rails', '~> 2.33', group: :development
