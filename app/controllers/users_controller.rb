class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @history = []
    @upcoming_events = Event.where(user: @user).where('date > ?', Date.today)
    @events = Event.where(user: @user).where('date <= ?', Date.today)
    @tickets = Ticket.where(user: @user)
  end
end
