class AppController < ApplicationController
  def index
    @stories = Story.all.order :happened_at
  end
end
