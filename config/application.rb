require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PreProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2


    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

    config.action_mailer.delivery_method = :smtp
  	config.action_mailer.smtp_settings = {
    
    config.action_mailer.smtp_settings = {
      :address              => 'smtp.gmail.com',
      :port                 => 587,
      :domain               => 'gmail.com',
      :user_name            => 'katarullosan@gmail.com',
      :password             => 'Kord12A2',
      :authentication       => 'plain',
      :enable_starttls_auto => true
  	}
    
    # config.assets.initialize_on_precompile = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
