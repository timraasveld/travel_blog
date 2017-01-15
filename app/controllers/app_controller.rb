class AppController < ApplicationController
  def index
    @stories = Story.all.map do |story|
      StorySerializer.new(story)
    end
  end
end
