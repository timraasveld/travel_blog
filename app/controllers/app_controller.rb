# Controller that shows the React SPA app with all data that may be required.
class AppController < ApplicationController
  def index
    stories = Story.all.map do |story|
      StorySerializer.new(story)
    end

    @react_props = {
      stories: stories.as_json,
      google_maps_api_key: Rails.application.secrets.google_maps_api_key
    }
  end
end
