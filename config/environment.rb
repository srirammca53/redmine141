# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

if RUBY_VERSION >= '1.9' && defined?(Rails) && Rails::VERSION::MAJOR < 3
  Encoding.default_external = 'UTF-8'
end

# Load Engine plugin if available
begin
  require File.join(File.dirname(__FILE__), '../vendor/plugins/engines/boot')
rescue LoadError
  # Not available
end

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence those specified here

  # Skip frameworks you're not going to use
  # config.frameworks -= [ :action_web_service, :action_mailer ]
#config.action_controller.session_store = :active_record_store
  # Add additional load paths for sweepers
  config.autoload_paths += %W( #{RAILS_ROOT}/app/sweepers )
   config.action_mailer.perform_deliveries = true
   config.action_mailer.delivery_method = :smtp
   config.action_mailer.raise_delivery_errors = true
   config.action_mailer.smtp_settings = {
	:enable_starttls_auto => true,
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "gmail.com",
	:authentication => :login,
	:user_name => "venkatnr@logicmatter.com",
	:password => "nishankara",
	}
  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Enable page/fragment caching by setting a file-based store
  # (remember to create the caching directory and make it readable to the application)
  # config.action_controller.cache_store = :file_store, "#{RAILS_ROOT}/tmp/cache"


  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
  config.active_record.observers = :message_observer, :issue_observer, :journal_observer, :news_observer, :document_observer, :wiki_content_observer, :comment_observer

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc

  # Use Active Record's schema dumper instead of SQL when creating the test database
  # (enables use of different database adapters for development and test environments)
  # config.active_record.schema_format = :ruby

  # Deliveries are disabled by default. Do NOT modify this section.
  # Define your email configuration in configuration.yml instead.
  # It will automatically turn deliveries on
  config.action_mailer.perform_deliveries = false

  # Load any local configuration that is kept out of source control
  # (e.g. gems, patches).
  if File.exists?(File.join(File.dirname(__FILE__), 'additional_environment.rb'))
    instance_eval File.read(File.join(File.dirname(__FILE__), 'additional_environment.rb'))
  end
end
