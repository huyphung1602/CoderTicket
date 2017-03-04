class VenuesController < ApplicationController
  def new
    @venue = Venue.new
    @regions = Region.all
  end

  def create
    @venue = Venue.new
    @regions = Region.all

    if @venue.save!
      flash[:success] = "Venue has been created successfully."
      redirect_to root_path
    else
      flash[:error] = "Failed to create venue. Please check all the field."
      redirect_to new_venue_path
    end
  end

  private
    def event_params
      params.require(:event).permit( :name, :full_address, :region_id)
    end
end
