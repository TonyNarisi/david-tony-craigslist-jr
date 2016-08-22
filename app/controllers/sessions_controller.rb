class SessionsController < ApplicationController
  def new
    redirect_to '/' if logged_in?
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @user.errors = ["Please enter a valid username/password"]
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
