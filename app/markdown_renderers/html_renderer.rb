class HTMLRenderer < Redcarpet::Render::HTML
  def image(link, title, content)
    "<img class='img-responsive' src='#{link}' />"
  end
end
