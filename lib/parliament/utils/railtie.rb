require_relative './helpers/application_helper'

module Parliament
  module Utils
    class Railtie < Rails::Railtie
      initializer 'parliament-utils.view_helpers' do
        require 'parliament/utils/config/initializers'
        ActionView::Base.send(:include, Helpers::ApplicationHelper)
      end
    end
  end
end
