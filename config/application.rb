require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ArchimateV2
  class Application < Rails::Application
    config.load_defaults 8.1
    config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.assets false           # <= css,javascriptファイルを作成しない
      g.skip_routes true       # <= routes.rbを変更しない
      g.helper false           # <= helperファイルを作成しない
      g.test_framework false   # <= テストファイルを作成しない
    end
  end
end
