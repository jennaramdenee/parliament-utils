RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  #Stubs Bandiera::Client methods enabled? and get_features_for_group to clean up logs
  #and streamline cassettes
  config.before(:each) do
    BANDIERA_CLIENT = Bandiera::Client.new(ENV['BANDIERA_URL'].dup)
    allow(BANDIERA_CLIENT).to receive(:enabled?).and_return(false)
    allow(BANDIERA_CLIENT).to receive(:get_features_for_group).and_return({})
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
end
