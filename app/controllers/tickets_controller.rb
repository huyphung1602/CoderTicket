class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket_type = TicketType.find(params[:ticket_type_id])
    @tickets_sold = Ticket.where(ticket_type_id: @ticket_type.id).sum(:quantity)
    puts "Ticket sold: #{@tickets_sold}"

    @ticket = Ticket.new
    @ticket.ticket_type_id = @ticket_type.id
    @ticket.quantity = params[:quantity].to_i
    puts "Huy Phung: #{params[:quantity]}"
    @ticket.total_price = params[:quantity].to_i * @ticket_type.price

    if @tickets_sold == @ticket_type.max_quantity
      flash[:error] = "Failed to purchase. All tickets of this type are sold"
      render 'new'
    else
      if @ticket.save
        flash[:success] = "Purchased successfully."
        redirect_to root_path
      else
        flash[:error] = @ticket.errors.full_messages.to_sentence
        render 'new'
      end
    end
  end

  private
    def ticket_params
      params.require(:message).permit(:quantity)
    end
end
