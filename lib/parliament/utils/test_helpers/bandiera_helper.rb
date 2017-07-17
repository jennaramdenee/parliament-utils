RSpec.configure do |config|
  #Stubs Bandiera::Client methods enabled? and get_features_for_group to clean up logs
  #and streamline cassettes
  config.before(:each) do
    BANDIERA_CLIENT ||= Bandiera::Client.new(ENV['BANDIERA_URL'].dup)
    allow(BANDIERA_CLIENT).to receive(:enabled?).and_return(false)
    allow(BANDIERA_CLIENT).to receive(:get_features_for_group).and_return({})
  end

end
