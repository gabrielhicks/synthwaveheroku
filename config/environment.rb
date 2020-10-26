require 'ipinfo-rails'
Rails.application.config.middleware.use(IPinfoMiddleware, {token: "<TOKEN_HERE>"})

# Initialize the Rails application.
require_relative 'application'
Rails.application.initialize!