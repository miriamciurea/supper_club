class EventsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
