# Dir["parliament/utils/initializers/*.rb"].each {|file| require file }
# Dir["parliament-utils/lib/parliament/utils/config/initializers/*.rb"].each { |f| require f }
# Dir[File.expand_path "lib/parliament/utils/config/initializers/*.rb"].each{|f| require_relative f}
# Dir[File.join(File.dirname(__FILE__), '../parliament/utils/config/initializers', '*.rb')].each { |file| require file }

require 'parliament/utils/config/initializers/airbrake'
require 'parliament/utils/config/initializers/assets'
require 'parliament/utils/config/initializers/backtrace_silencers'
require 'parliament/utils/config/initializers/bandiera'
require 'parliament/utils/config/initializers/cookies_serializer'
require 'parliament/utils/config/initializers/filter_parameter_logging'
require 'parliament/utils/config/initializers/inflections'
require 'parliament/utils/config/initializers/mime_types'
require 'parliament/utils/config/initializers/session_store'
require 'parliament/utils/config/initializers/timeout'
require 'parliament/utils/config/initializers/wrap_parameters'
