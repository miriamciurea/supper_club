class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
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
    params.require(:event).permit(:user_id, :venue, :menu, :cuisine, :price, :description, :capacity, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def index
  end
end
