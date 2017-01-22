describe StorySerializer do
  let(:story) { Fabricate(:story) }
  subject { described_class.new(story).to_h }

  it 'includes expected attributes (see expectation)' do
    expect(subject).to eq id: story.id,
                          body: "<h1>Title</h1>\n",
                          key: story.key,
                          happened_at: story.happened_at.iso8601,
                          latitude: story.latitude,
                          longitude: story.longitude,
                          sign_body: "<h1>A traffic sign</h1>\n"
  end
end
