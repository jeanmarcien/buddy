require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Remplacez par votre vrai domaine
  config.action_mailer.default_url_options = { host: "https://votre-domaine.com" }

  # Settings specified here will take precedence over those in config/application.rb.
  config.enable_reloading = false
  config.eager_load = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensure master key is present for encrypted credentials
  config.require_master_key = true

  # Asset pipeline configuration
  config.assets.compile = true
  config.assets.initialize_on_precompile = false
  config.assets.css_compressor = :sass

  # Active Storage configuration
  config.active_storage.service = :cloudinary

  # Force SSL
  config.force_ssl = true

  # Logging configuration
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  config.log_tags = [ :request_id ]
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Action Mailer configuration
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = false

  # I18n configuration
  config.i18n.fallbacks = true

  # Active Support configuration
  config.active_support.report_deprecations = false

  # Active Record configuration
  config.active_record.dump_schema_after_migration = false

  # Host authorization
  config.hosts = [
    "votre-domaine.com",
    /.*\.votre-domaine\.com/
  ]
end