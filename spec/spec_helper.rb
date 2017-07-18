# Test files
require 'parliament/utils'

# Application Files
require 'parliament'
require 'parliament/ntriple'
require 'parliament/utils'
require 'bandiera/client'
require 'parliament/grom/decorator'


RSpec.configure do |config|
  Parliament::Utils::TestHelpers.included_modules.each do |m|
    m.load_rspec_config(config)
  end
end
