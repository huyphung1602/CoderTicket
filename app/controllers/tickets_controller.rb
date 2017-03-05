class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket_types = TicketType.where(event_id: @event.id)
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event_id])

    current_time = Time.now

    @ticket_types = TicketType.where(event_id: @event.id)
    @ticket_type = TicketType.find(params[:ticket_type_id])
    @remain_tickets = @ticket_type.max_quantity - @ticket_type.tickets.count

    @ticket = Ticket.new
    @ticket.event_id = @event.id
    @ticket.ticket_type_id = @ticket_type.id

    @ticket.name = params[:name]
    @ticket.phone = params[:phone]
    @ticket.address = params[:address]
    @ticket.quantity = params[:quantity].to_i
    @ticket.total_price = params[:quantity].to_i * @ticket_type.price

    if @event.ends_at < current_time
      flash[:error] = "Failed to purchase. This event was end"
      render 'new'
    else
      if @ticket.save
        flash[:success] = "Purchased successfully."
        redirect_to upcoming_path
      else
        flash[:error] = @ticket.errors.full_messages.to_sentence
        render 'new'
      end
    end
  end

  private
    def ticket_params
      params.require(:message).permit(:quantity, :ticket_type_id, :total_price)
    end
end