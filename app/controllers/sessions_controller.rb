class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user
      session[:user_id] = @user.id
      redirect_to chatrooms_path
    else
      render :new, status: 404
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end