require 'guard/compat/plugin'
require File.expand_path('../../../config/environment',  __FILE__)
require 'story'

module Guard
  class StorySeeds < Plugin
    def run_on_additions(_)
      reseed_stories
    end

    def run_on_modifications(_)
      reseed_stories
    end

    def reseed_stories
      log 'Reseeding stories'

      Story.delete_all
      load "#{Rails.root}/db/seeds.rb"

      log 'Reseeded stories'
    end

    def log(text)
      ::Guard::UI.info text, reset: true
    end
  end
end

