describe Story do
  let(:story) { Fabricate :story, body: '# Title' }

  describe '#body_html and #sign_body_html render markdown as HTML' do
    subject { story.body_html }
    it { is_expected.to eq "<h1>Title</h1>\n" }
  end

  describe '#location' do
    it 'sets latitude and longitude after validation' do
      expect(story.latitude).to be_nil
      expect(story.longitude).to be_nil

      story.location = 'New York City'
      story.valid? # trigger after_validation callbacks

      expect(story.latitude).to be_a Float
      expect(story.longitude).to be_a Float
    end
  end
end
