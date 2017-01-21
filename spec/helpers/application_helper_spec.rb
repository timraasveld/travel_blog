describe ApplicationHelper do
  let(:described_class) do
    Class.new do
      extend ApplicationHelper
    end
  end

  describe '#render_markdown' do
    subject { described_class.render_markdown markdown }

    describe '#render_markdown converts markdown to html' do
      let(:markdown) { '# [A big link](example.com)' }

      it { is_expected.to eq "<h1><a href=\"example.com\">A big link</a></h1>\n" }
    end

    describe '#render_markdown adds img-responsive class to images' do
      let(:markdown) { '![some alt text](example.com)' }

      it { is_expected.to eq "<p><img class=\"img-responsive\" alt=\"some alt text\" src=\"example.com\" /></p>\n" }
    end
  end
end
