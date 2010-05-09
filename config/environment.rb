# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Cinema::Application.configure do
  config.time_zone = 'Warsaw'
  config.i18n.default_locale = :pl
end
Cinema::Application.initialize!
