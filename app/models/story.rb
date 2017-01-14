class Story < ApplicationRecord
  validates :map_css_class, :sign_body, :happened_at, :body, presence: true

  # Allow setting latitude and longitude by setting non-persistent location, e.g. "Assen, Drenthe, Netherlands" or "Monkey Temple Kathmandu"
  attr_accessor :location
  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode

  def sign_body_html
    render_markdown sign_body
  end

  def body_html
    render_markdown body
  end

  def render_markdown(markdown)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    renderer.render markdown
  end
end
