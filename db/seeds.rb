# Write stories in db/stories
Dir.glob('db/stories/*.yml').map do |f|
  # Use file name as CSS class
  YAML.load_file(f).merge css_class: f.gsub('.yml', '')
end.each do |story_hash|
  Story.create! story_hash
end
