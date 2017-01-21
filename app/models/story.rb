class Story < ApplicationRecord
  default_scope { order(:happened_at) }

  validates :css_class, :sign_body, :happened_at, :body, presence: true

  # Allow setting latitude and longitude by setting non-persistent location, e.g. "Assen, Drenthe, Netherlands" or "Monkey Temple Kathmandu"
  attr_accessor :location
  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode

  # Call sign_body_html or body_html for rendered markdown
  %i(sign_body body).each do |markdown_attribute|
    define_method "#{markdown_attribute}_html" do
      render_markdown send(markdown_attribute)
    end
  end

  private

  def render_markdown(markdown)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    renderer.render markdown
  end
end
