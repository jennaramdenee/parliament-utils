require 'spec_helper'

RSpec.describe Parliament::Utils::Helpers::MarkdownHelper do
  it 'is a module' do
    expect(subject).to be_a(Module)
  end

  context '#markdown' do
    context 'text' do
      it 'converts markdown to HTML' do
        text = 'You can submit an oral question online using [e-tabling](https://etabling.parliament.uk/)'
        expect(subject.markdown(text)).to match('<p>You can submit an oral question online using <a href=\"https://etabling.parliament.uk/\">e-tabling</a></p>')
      end
    end

    context 'video' do
      context 'parliament live tv video' do
        it 'converts link to iframe HTML' do
          video_url = 'https://parliamentlive.tv/event/index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8?in=10:00:00&out=12:00:00'
          text = "You can include a video in your markdown #{video_url}"
          expect(subject.markdown(text)).to eq(
            %(<p>You can include a video in your markdown </p><div class="video-wrap">
<iframe src="https://videoplayback.parliamentlive.tv/Player/Index/1b5736b4-7c93-4827-a02f-abbf0bb36cc8?in=10:00:00&amp;out=12:00:00&amp;audioOnly=False&amp;autoStart=False&amp;statsEnabled=False" name="UKPPlayer" title="UK Parliament Player" seamless="seamless" frameborder="0" allowfullscreen style="width: 100%;height: 100%;"></iframe>
</div>
)
          )
        end
      end
    end
  end
end
