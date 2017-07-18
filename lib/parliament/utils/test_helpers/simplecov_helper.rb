module Parliament
  module Utils
    module TestHelpers
      module SimpleCovHelper
        
        require 'coveralls'
        require 'simplecov'

        def self.load_rspec_config(config)

          SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
            Coveralls::SimpleCov::Formatter,
            SimpleCov::Formatter::HTMLFormatter
            ])
            SimpleCov.start
          end
        end
      end
    end
  end
