module Parliament
  module Utils
    module TestHelpers
      module TranslationHelper
        def self.load_rspec_config(config)
          require 'i18n'

          I18n.load_path = ['config/locales/en.yml']
          I18n.backend.load_translations
        end
      end
    end
  end
end
