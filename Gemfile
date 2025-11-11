source "https://rubygems.org"

ruby "3.3.3"

# Framework principal
gem "rails", "~> 7.1.6"

# Base de datos
gem "pg", "~> 1.1"

# Servidor web
gem "puma", ">= 5.0"

# Sistema de assets
gem "sprockets-rails"

# Turbo + Stimulus
gem "stimulus-rails"
gem "turbo-rails"

# Seguridad / autenticación
gem "bcrypt", "~> 3.1.7"
gem "api_guard"
gem "jwt"

# Autorización / paginación / filtros
gem "kaminari"
gem "pundit"
gem "ransack"

# API / respuestas / requests
gem "responders"
gem "useragent"
gem "rack-cors", require: "rack/cors"
gem "faraday"
gem "faraday-retry"
gem "dry-initializer"
gem "base64", "0.1.1"

# Background jobs
gem "sidekiq"
gem "redis", "~> 4.0"

# Archivos, imágenes y PDFs
gem "carrierwave", ">= 3.0.0.beta", "< 4.0"
gem "mini_magick"
gem "rmagick"
gem "aws-sdk-s3", "~> 1"
gem "wicked_pdf"
gem "image_processing", "~> 1.2"

# Utilidades
gem "jbuilder"
gem "bootsnap", require: false
gem "dotenv-rails", groups: [:development, :test]
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "web-console"
  gem "bcrypt_pbkdf", ">= 1.0", "< 2.0", require: false
  gem "rufo"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
