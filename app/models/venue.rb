class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

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
