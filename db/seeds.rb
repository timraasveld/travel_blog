# Write stories in db/stories
Dir.glob('db/stories/*.yml').map { |f| YAML.load_file f }.each do |story_hash|
  Story.create! story_hash
end
