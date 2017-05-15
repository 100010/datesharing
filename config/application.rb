require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Datesharering
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #localeファイルのパス設定
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales','**' ,'*.{rb,yml}').to_s]
    #デフォルトを日本語に設定
    config.i18n.default_locale = :ja
  end
end
