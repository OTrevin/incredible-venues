class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user_id = current_user.id
    @venue.save
    redirect_to venue_path(@venue)
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to venue_path
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :description, :address, :price_per_day, :capacity, photos: [])
  end
end
