class BookingsController < ApplicationController

  def create
    @venue= Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    @booking.venue_id = @venue.id
    @booking.user_id = current_user.id
    @booking.total_price = (@booking.end_date - @booking.start_date) * @venue.price_per_night
    if @booking.save
      redirect_to account_bookings_path
    else
      render "venue/show"
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
