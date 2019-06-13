class UsersController < ApplicationController
  def new
    render 'new'
  end
  def create
    @user = User.create(first_name:params[:First_Name],last_name:params[:Last_Name],email:params[:Email],location:params[:Location], password:params[:Password], password_confirmation:params[:Password_Confirmation])  
    if @user && @user.password == @user.password_confirmation
      return redirect_to '/sessions/new'
    end
    flash[:errors] = ["can't be blank text"]
    return redirect_to '/users/new'
  end

  def show
    # @event = Event.where(user:User.find(session[:user_id]))
    @event = User.find(session[:user_id]).events_attending
    @other = Event.where.not(user:User.find(session[:user_id]))
    render 'show'
  end

  def edit
    @user = User.find(session[:user_id])
    render 'edit'
  end
  def update
    @user = User.find(session[:user_id])
    @user.update(email:params[:Email])
    if @user.save
    # redirect_to "/users/#{session[:user_id]}/edit"
      @user.update(first_name:params[:First_Name],last_name:params[:Last_Name],location:params[:Location])
      if @user.save
        return redirect_to "/users/#{session[:user_id]}"
      else
        flash[:errors]=["Name is invalid"]
        return redirect_to "/users/#{session[:user_id]}/edit"
      end
    else
      flash[:errors] =["Email is invalid"]
      redirect_to "/users/#{session[:user_id]}/edit"
    end

  end
  def destroy
    @user = User.find(session[:user_id])
    session[:user_id] = nil
    return redirect_to '/sessions/new'
  end
  private 
  def user_params
    params.permit(:name, :email, :password, :salt, :encrypted_password)
  end
end
