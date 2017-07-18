require_relative './test_helpers/rspec_helper'
require_relative './test_helpers/rails_helper' if defined?(Rails)
require_relative './test_helpers/simplecov_helper'
require_relative './test_helpers/translation_helper'
require_relative './test_helpers/vcr_helper'
require_relative './test_helpers/webmock_helper'
require_relative './test_helpers/bandiera_helper'

module Parliament
  module Utils
    module TestHelpers

      include Parliament::Utils::TestHelpers::RSpecHelper
      include Parliament::Utils::TestHelpers::RailsHelper if defined?(Rails)
      include Parliament::Utils::TestHelpers::SimpleCovHelper
      include Parliament::Utils::TestHelpers::TranslationHelper
      include Parliament::Utils::TestHelpers::VCRHelper
      include Parliament::Utils::TestHelpers::WebmockHelper
      include Parliament::Utils::TestHelpers::BandieraHelper

    end
  end
end
