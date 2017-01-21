module ApplicationHelper
  def render_markdown(markdown)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    renderer.render markdown
  end
end
