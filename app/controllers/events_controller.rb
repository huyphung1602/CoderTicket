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
end