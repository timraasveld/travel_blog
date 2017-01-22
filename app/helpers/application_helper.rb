# Helper methods that can be used in both views (app/views) and serializer (app/serializers)
module ApplicationHelper
  def render_markdown(markdown)
    config = { autolink: true,
               tables: true,
               hard_wrap: true }
    renderer = Redcarpet::Markdown.new(HTMLRenderer, config)
    renderer.render markdown
  end
end
