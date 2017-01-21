describe ApplicationHelper do
  let(:described_class) do
    Class.new do
      extend ApplicationHelper
    end
  end

  describe '#render_markdown converts markdown to html' do
    let(:markdown) { '# [A big link](example.com)' }
    subject { described_class.render_markdown markdown }

    it { is_expected.to eq "<h1><a href=\"example.com\">A big link</a></h1>\n" }
  end
end
