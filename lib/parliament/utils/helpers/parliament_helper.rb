require 'parliament'
require 'parliament/ntriple'

module Parliament
  module Utils
    module Helpers
      module ParliamentHelper
        def self.parliament_request
          Parliament::Request::UrlRequest.new(
          builder:    Parliament::Builder::NTripleResponseBuilder,
          headers:    { 'Ocp-Apim-Subscription-Key': ENV['PARLIAMENT_AUTH_TOKEN'] },
          decorators: Parliament::Grom::Decorator
          )
        end

        def parliament_request
          Parliament::Utils::Helpers::ParliamentHelper.parliament_request
        end
      end
    end
  end
end
