class BookingsController < ApplicationController

  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    @booking.venue_id = @venue.id
    @booking.user_id = current_user.id
    # if @booking.price_per_day == false
    #   @booking.total_price = (@booking.end_date - @booking.start_date) * @venue.price_per_half_day
    # else
      @booking.total_price = (@booking.end_date - @booking.start_date) * @venue.price_per_day
    # end

    if @booking.save
      redirect_to account_bookings_path
    else
      render "venue/show"
    end

    def edit
      @booking = Booking.find(params[:id])
    end

    def update
      @booking = Booking.find(params[:id])
      if @booking.update
        redirect_to account_bookings_path
      else
        render "venues/show"
      end
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to account_bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price_per_day, :status)
  end
end
