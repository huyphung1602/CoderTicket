class TicketTypesController < ApplicationController
  def new
    @ticket_type = TicketType.new
    @event = Event.find(params[:event_id])
  end

  def create 
    @ticket_type = TicketType.new ticket_params
    @event = Event.find(params[:event_id])
    @ticket_type.event_id = @event.id

    if @ticket_type.save
      flash[:success] = "Ticket Type has been created successfully."
      redirect_to "/events/#{@ticket_type.event_id}"
    else
      render 'new'
    end
  end

  private
    def ticket_params
      params.require(:ticket_type).permit( :name, :price, :max_quantity)
    end
end
