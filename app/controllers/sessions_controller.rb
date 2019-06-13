class SessionsController < ApplicationController
  def new
    render 'new'
  end
  # check email and password, since password is hashed must check the hashed password not plain text
  def create
    @user = User.find_by_email(params[:Email])
    if @user && @user.authenticate(params[:Password])
      session[:user_id] = @user.id   
      flash[:notice] = ["Welcome #{@user.first_name}"]   
      # @user = current_user 
      return redirect_to "/users/#{session[:user_id]}"
      # redirect_to 'users/@user.id'
    end
      flash[:errors] = ["Invalid Combination"]
      redirect_to '/sessions/new'
    
      # Log User In
      # if authenticate true
          # save user id to session
          # redirect to users profile page
      # if authenticate false
          # add an error message -> flash[:errors] = ["Invalid"]
          # redirect to login page
  end
  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
      # Log User out
      # set session[:user_id] to null
      # redirect to login page
  end
end
