class VenueAmenity < ApplicationRecord
  belongs_to :venue
  belongs_to :amenity
  validates :venue, uniqueness: { scope: :amenity,
  message: "You can't add several times same amenity" }
end
