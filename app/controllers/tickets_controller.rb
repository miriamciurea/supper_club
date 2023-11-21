class TicketsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to @ticket, notice: "ticket created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :event_id, :start_time, :end_time, :guests)
  end
end
