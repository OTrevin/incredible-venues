class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search_result]

  def home
    @booking = Booking.new
    @venues = Venue.all

  end

  def search_result
    @venues = Venue.where("name ILIKE ?", params[:search][:name])
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
