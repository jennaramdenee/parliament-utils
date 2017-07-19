module Parliament
  module Utils
    module Helpers
      module TranslationHelper
        require 'i18n'
        
        I18n.load_path = ['config/locales/en.yml']
        I18n.backend.load_translations
      end
    end
  end
end
