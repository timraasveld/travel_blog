class StorySerializer < ActiveModel::Serializer
  include ApplicationHelper
  attributes :id, :latitude, :longitude, :css_class, :sign_body, :body, :happened_at

  def sign_body
    render_markdown object.sign_body
  end

  def body
    render_markdown object.body
  end
end
