require_relative '../services/markdown_converter'
require 'redcarpet'

module Parliament
  module Utils
    module Helpers
      module MarkdownHelper
        # Uses redcarpet gem to convert markdown into HTML, with chosen HTML extensions
        #
        # @return template [String] Template as HTML
        def self.markdown(template)
          markdown = Redcarpet::Markdown.new(Parliament::Utils::Services::ParliamentMarkdownRenderer, tables: true, autolink: true)
          html = markdown.render(ActionController::Base.helpers.sanitize(template))
          ActionController::Base.helpers.sanitize(html).html_safe
        end
      end
    end
  end
end
