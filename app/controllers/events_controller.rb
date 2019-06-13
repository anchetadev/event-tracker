class EventsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @event = Event.create(name:params[:name], date:params[:date], location:params[:location], user:User.find(session[:user_id]))
    redirect_to "/users/#{@user.id}"
  end
  def join
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
    # Attendee.create(user:@user, event:Event.find(id:params[:id]))
    Attendee.create(user:@user, event:@event)
    redirect_to "/users/#{@user.id}"
  end

  def show
    @event = Event.find(params[:id])
    @user = Attendee.where.not(id:session[:user_id])
    render 'show'
  end
end
