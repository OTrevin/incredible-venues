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
    # raise
    # @booking.status = false
    # @booking_status = @booking.status
  end

  def my_listings
    @venues = Venue.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @venue = Venue.new
    @bookings = Booking.where(venue_id: @venues)
    # raise
  end


  def edit
    @booking = Booking.find(params[:id])
    @venue = Venue.find(@booking.venue_id)
    # raise
  end

  def update
    raise
    @booking = Booking.find(params[:id])
    if @booking.update
      redirect_to account_bookings_path
    else
      render "venues/show"
    end
  end

  def destroy
    # @venue = Venue.find(params[:id])
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to account_bookings_path
  end

end
