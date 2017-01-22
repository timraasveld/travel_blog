# Story shown on map and blog.
class Story < ApplicationRecord
  default_scope { order(:happened_at) }

  validates :key, :sign_body, :happened_at, :body, presence: true

  # Allow setting latitude and longitude by setting non-persistent location,
  # e.g. "Assen, Drenthe, Netherlands" or "Monkey Temple Kathmandu"
  attr_accessor :location
  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode
end
