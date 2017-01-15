class StorySerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :css_class, :sign_body, :body, :happened_at

  def sign_body
    object.sign_body_html
  end

  def body
    object.body_html
  end
end
