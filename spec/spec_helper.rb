# Application Files
require 'parliament'
require 'parliament/ntriple'
require 'parliament/utils'
require 'bandiera/client'
require 'parliament/grom/decorator'

# Load RSpec configurations held within all test helper modules included in the
# overarching Parliament::Utils::TestHelpers module
RSpec.configure do |config|
  Parliament::Utils::TestHelpers.included_modules.each do |m|
    m.load_rspec_config(config)
  end
end
