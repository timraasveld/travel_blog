module ApplicationHelper
  def render_markdown(markdown)
    config = { autolink: true,
               tables: true,
               hard_wrap: true }
    renderer = Redcarpet::Markdown.new(HTMLRenderer, config)
    renderer.render markdown
  end
end
