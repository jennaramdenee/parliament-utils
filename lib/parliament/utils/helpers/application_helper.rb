module Parliament
  module Utils
    module Helpers
      module ApplicationHelper
        # Sets the title for a page.
        #
        # @param [String] page_title the title of the page.
        # @return [String] the title of the page.
        def title(page_title)
          content_for(:title) { page_title }
          page_title
        end
        # Before every request that provides data, see if the user is requesting a format that can be served by the data API.
        # If they are, transparently redirect them with a '302: Found' status code
        def data_check
          # Check format to see if it is available from the data API
          return if !Parliament::Utils::Helpers::FormatHelper::DATA_FORMATS.include?(request.formats.first) || (params[:controller] == 'constituencies' && params[:action] == 'map')

          # Find the current controller/action's API url
          @data_url = data_url

          # Catch potential nil values
          raise StandardError, 'Data URL does not exist' if @data_url.nil?

          response.headers['Accept'] = request.formats.first
          redirect_to(@data_url.call(params).query_url) && return
        end

        # Get the data URL for our current controller and action OR raise a StandardError
        #
        # @raises [StandardError] if there is no Proc available for a controller and action pair, we raise a StandardError
        #
        # @return [Proc] a Proc which can be called to generate a data URL
        def data_url
          self.class::ROUTE_MAP[params[:action].to_sym] || raise(StandardError, "You must provide a ROUTE_MAP proc for #{params[:controller]}##{params[:action]}")
        end

        # Populates @request with a data url which can be used within controllers.
        def build_request
          @request = data_url.call(params)

          populate_alternates(@request.query_url)
        end

        # Populates Pugin.alternates with a list of data formats and corresponding urls
        #
        # @param [String] url the url where alternatives can be found
        def populate_alternates(url)
          alternates = []

          Parliament::Utils::Helpers::FormatHelper::DATA_FORMATS.each do |format|
            alternates << { type: format, href: url }
          end

          Pugin.alternates = alternates
        end
      end
    end
  end
end
