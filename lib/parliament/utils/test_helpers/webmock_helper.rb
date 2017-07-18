module Parliament
  module Utils
    module TestHelpers
      module WebmockHelper
        def self.load_rspec_config(config)
          require 'webmock/rspec'

          WebMock.disable_net_connect!(allow_localhost: true)
        end
      end
    end
  end
end
