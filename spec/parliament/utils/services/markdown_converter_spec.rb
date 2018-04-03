require 'spec_helper'

RSpec.describe Parliament::Utils::Services::ParliamentMarkdownRenderer do
  let(:parliament_markdown_renderer) { described_class.new }

  context 'Parliament Live TV' do
    context '#parliament_live_video_embed' do
      context 'when link is valid' do
        context 'with start and end time' do
          it 'returns iframe HTML string replacement' do
            expect(parliament_markdown_renderer.send(:parliament_live_video_embed, 'https://parliamentlive.tv/event/index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8?in=10:00:00&out=12:00:00')).to eq(
        %(<div class="video-wrap">
<iframe src="https://videoplayback.parliamentlive.tv/Player/Index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8?in=10:00:00&out=12:00:00&audioOnly=False&amp;autoStart=False&amp;statsEnabled=False" name="UKPPlayer" title="UK Parliament Player" seamless="seamless" frameborder="0" allowfullscreen style="width: 100%; height: 100%"></iframe>
</div>)
            )
          end
        end

        context 'with no start or end time' do
          it 'returns iframe HTML string replacement' do
            expect(parliament_markdown_renderer.send(:parliament_live_video_embed, 'https://parliamentlive.tv/event/index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8')).to eq(
        %(<div class="video-wrap">
<iframe src="https://videoplayback.parliamentlive.tv/Player/Index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8?audioOnly=False&amp;autoStart=False&amp;statsEnabled=False" name="UKPPlayer" title="UK Parliament Player" seamless="seamless" frameborder="0" allowfullscreen style="width: 100%; height: 100%"></iframe>
</div>)
            )
          end
        end
      end
    end

    context '#autolink' do
      context 'valid link and link type' do
        it 'generates iframe HTML string replacement' do
          expect(parliament_markdown_renderer).to receive(:parliament_live_video_embed).with('https://parliamentlive.tv/event/index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8')
          parliament_markdown_renderer.autolink('https://parliamentlive.tv/event/index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8', :url)
        end
      end

      context 'invalid link' do
        it 'returns original link' do
          expect(parliament_markdown_renderer.autolink('https://test.com', :url)).to eq('https://test.com')
        end
      end

      context 'invalid link type' do
        it 'returns original link' do
          expect(parliament_markdown_renderer.autolink('https://parliamentlive.tv/event/index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8', :fake)).to eq('https://parliamentlive.tv/event/index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8')
        end
      end
    end
  end
end
