class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @events = Event.all
    if params[:query].present?
      # @events = @events.where("venue ILIKE ?", "%#{params[:query]}%")
      # sql_subquery = "venue ILIKE :query OR cuisine ILIKE :query"
      # @events = @events.where(sql_subquery, query: "%#{params[:query]}%")
      sql_subquery = <<~SQL
      events.venue @@ :query
      OR events.cuisine @@ :query
      OR events.menu @@ :query
      OR events.description @@ :query
      OR users.first_name @@ :query
      OR users.last_name @@ :query
      SQL
     @events = @events.joins(:user).where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @ticket = Ticket.new

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: "Event created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event was successfully canceled."
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :venue, :menu, :cuisine, :price, :description, :capacity, :date, photos: [])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
