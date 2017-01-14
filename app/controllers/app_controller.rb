class AppController < ApplicationController
  def index
    @stories = Story.all.order(:happened_at).map do |story|
      StorySerializer.new(story)
    end
  end
end
