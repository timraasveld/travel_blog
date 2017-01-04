class Story < ApplicationRecord
  validates :body, :happened_at, presence: true

  # Allow setting address by setting non-persistent "location" string"
  attr_accessor :location
  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode
end
