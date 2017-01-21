require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TravelBlog
  class Application < Rails::Application
    %w(serializers markdown_renderers).each do |code_directory|
      config.autoload_paths << "#{Rails.root}/app/#{code_directory}"
    end
  end
end
