class EventsController < ApplicationController
  def index
    @events = Event.all.order('created_at DESC')

    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    end
  end

  def show
    @event = Event.find(params[:id].to_param)
  end

  def new
    @event = Event.new
    @categories = Category.all
    @venues = Venue.all
  end

  def create
    @event = Event.new user_params
    @categories = Category.all
    @venues = Venue.all

    if @event.save!
      flash[:success] = "Event has been created successfully."
      redirect_to root_path
    else
      flash[:error] = "Failed to create event. Please check all the field."
      redirect_to new_event_path
    end
  end

  private
    def event_params
      params.require(:event).permit(:starts_at, :ends_at, :venue_id,
          :hero_image_url, :extended_html_description, :category_id,
          :name)
    end
end