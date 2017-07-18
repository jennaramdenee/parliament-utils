module Parliament
  module Utils
    module TestHelpers
      module BandieraHelper
        def self.load_rspec_config(config)
          #Stubs Bandiera::Client methods enabled? and get_features_for_group to clean up logs
          #and streamline cassettes
          # RSpec.configure do |config|
          config.before(:each) do
            allow(BANDIERA_CLIENT).to receive(:enabled?).and_return(false)
            allow(BANDIERA_CLIENT).to receive(:get_features_for_group).and_return({})
          end
        end
      end
    end
  end
end
