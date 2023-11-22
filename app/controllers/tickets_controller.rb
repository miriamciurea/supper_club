class TicketsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.event = @event
    if @ticket.save
      redirect_to profile_path(current_user), notice: "ticket created successfully!"
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to profile_path(current_user), notice: "Event was successfully canceled."
  end

  private

  def ticket_params
    params.require(:ticket).permit(:start_time, :end_time, :guests)
  end
end
