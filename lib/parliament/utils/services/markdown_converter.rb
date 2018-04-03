require 'uri'
require 'redcarpet'

module Parliament
  module Utils
    module Services
      class ParliamentMarkdownRenderer < Redcarpet::Render::HTML
        # Overrides default autolink behaviour of redcarpet gem for instances such as video embeds
        #
        # @param link [String] The link
        # @param link_type [Symbol] The link type
        # @return template [String] Original link text or HTML string replacement
        #
        def autolink(link, link_type)
          if link_type == :url
            return parliament_live_video_embed(link) if link.match(/parliamentlive.tv\/event\/index\/[a-z0-9-]{36}/i)
          end

          link # call super instead if we actually want autolinking
        end

        private

        # Takes a parliamentlive.tv embed or video link and returns HTML for video embed
        #
        # @private
        #
        # @param link [String] The URL for a parliamentlive.tv embed or video
        # @return template [String] The parliamentlive.tv video embed code
        #
        def parliament_live_video_embed(link)
          uri = URI.parse(link)

          # Generate video URL
          video_url = "https://videoplayback.parliamentlive.tv/Player/Index".tap do |url|
            # Add video ID
            url << "/#{uri.path.split('/').last}?"
            # Add original query if present, and not an empty string
            url << "#{uri.query}&" if uri.query&.size
            # Add player options
            url << 'audioOnly=False&amp;autoStart=False&amp;statsEnabled=False'
          end

          # Return the video player
          %(<div class="video-wrap">
<iframe src="#{video_url}" name="UKPPlayer" title="UK Parliament Player" seamless="seamless" frameborder="0" allowfullscreen style="width: 100%; height: 100%"></iframe>
</div>)
        end
      end
    end
  end
end
