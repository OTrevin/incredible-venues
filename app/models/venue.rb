class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many :venue_amenities
  has_many :amenities, through: :venue_amenities
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :address, :description ],
    using: {
      tsearch: { prefix: true }
    }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def unavailable_dates_edit(user)
    bookings.where(user: user).pluck(:start_date, :end_date).map do |range|
      { from: range[0] + 200, to: range[1] }
    end
  end
end
