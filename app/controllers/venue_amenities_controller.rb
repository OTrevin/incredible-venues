class VenueAmenitiesController < ApplicationController
    def new
        @venue = Venue.find(params[:venue_id])
        @venue_amenity = VenueAmenity.new
    end

    def edit
        @venue_amenity = VenueAmenity.find(params[:id])
    end
    
    private 

    def create
    @venue = Venue.find(params[:venue_id])
    @amenities = Amenity.find(params[:venue_amenity][:amenity])
    @amenities.each do |amenity|
        venue_amenity = VenueAmenity.new
        venue_amenity.venue = @venue
        venue_amenity.amenity = amenity
        venue_amenity.save
    end
    redirect_to venue_path(@venue.user)
    end

    def update
        @venue_amenity = VenueAmenity.find(params[:id])
        @venue_amenity.update(amenity_params)
        redirect_to venue_path( @venue )
    end

    def amenity_params
        params.require(:venue_amenity).permit(:name, :amenity_id)
    end


end
    
