def story_hashes
  Dir.glob('db/stories/*.yml').map do |f|
    # Use file name as CSS class
    YAML.load_file(f).merge key: File.basename(f).gsub('.yml', '')
  end
end

# Write stories in db/stories
story_hashes.each do |story_hash|
  Story.create! story_hash
end
