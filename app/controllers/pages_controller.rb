class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search_result]

  def home
    @booking = Booking.new
    @venues = Venue.all

  end

  def search_result
    @venues = Venue.search_by_name_and_description(params[:search][:name])
    # @venues = Venue.geocoded # returns flats with coordinates
    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude
      }
    end
  end
  

  def account
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
  end

  def bookings
    @user = User.find(current_user.id)
    @bookings = Booking.where(user_id: @user)
  end

  def my_listings
    @user = User.find(current_user.id)
    @venu = Venue.new
  end

end
