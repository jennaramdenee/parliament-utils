module Parliament
  module Utils
    module TestHelpers
      module RailsHelper
        def self.load_rspec_config(config)
          Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
#           # RSpec Rails can automatically mix in different behaviours to your tests
#           # based on their file location, for example enabling you to call `get` and
#           # `post` in specs under `spec/controllers`.
#           #
#           # You can disable this behaviour by removing the line below, and instead
#           # explicitly tag your specs with their type, e.g.:
#           #
#           #     RSpec.describe UsersController, :type => :controller do
#           #       # ...
#           #     end
#           #
#           # The different available types are documented in the features, such as in
#           # https://relishapp.com/rspec/rspec-rails/docs
          config.infer_spec_type_from_file_location!
#
#           # Filter lines from Rails gems in backtraces.
          config.filter_rails_from_backtrace!
#           # arbitrary gems may also be filtered via:
#           # config.filter_gems_from_backtrace("gem name")
          config.include Parliament::Utils::Helpers::ApplicationHelper
#
#           # Set Parliament::Utils::Helpers::HousesHelper#set_ids instance variables to nil after each spec.
#           # Calling certain Parliament::Utils::Helpers::HousesHelper methods (e.g. Parliament::Utils::Helpers::HousesHelper#commons?) causes
#           # Parliament::Utils::Helpers::HousesHelper#set_ids to be called which sets @commons_id and @lords_id.
#           # Setting these to nil causes each spec that requires them to make another
#           # Parliament::Utils::Helpers::ParliamentHelper request and generate a VCR cassette and stops any RSpec
#           # ordering issues where they may or may not have been set by the previous spec.
          config.after(:each) do
            Parliament::Utils::Helpers::HousesHelper.instance_variable_set(:@commons_id, nil)
            Parliament::Utils::Helpers::HousesHelper.instance_variable_set(:@lords_id, nil)
          end
        end
      end
    end
  end
end
