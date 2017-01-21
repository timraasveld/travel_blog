# Tests done in spec/helpers/application_helper_spec.rb
class HTMLRenderer < Redcarpet::Render::HTML
  def image(link, title, content)
    "<img class=\"img-responsive\" alt=\"#{content}\" src=\"#{link}\" />"
  end
end
