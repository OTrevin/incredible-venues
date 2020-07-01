class BookingsController < ApplicationController

  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    @booking.venue_id = @venue.id
    @booking.user_id = current_user.id
    @booking.total_price = (@booking.end_date - @booking.start_date) * @venue.price_per_day

    if @booking.save
      redirect_to account_bookings_path
    else
      render "venue/show"
    end

    def update
      @booking = Booking.find(params[:id])
      @venue = Venue.find(params[:venue_id])
      if @booking.update(booking_params)
        @booking.total_price = (@booking.end_date - @booking.start_date).to_i * @venue.price_per_day
        @booking.save
        redirect_to account_bookings_path
      else
        render "pages/bookings"
      end
    end


    def edit
      @booking = Booking.find(params[:id])
    end

    # def destroy
    #   @booking = Booking.find(params[:id])
    #   @booking.destroy
    #   redirect_to account_bookings_path
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price_per_day, :status)
  end
end
