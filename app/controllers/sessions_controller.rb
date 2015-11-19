class SessionsController < ApplicationController

  def new
  end

  def create
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirmation]

    user = User.find_by username: username
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: "You have logged in!"
    else
      flash.now[:alert] = "Username and Password do not match"
      render :new
    end
  end

  def delete
    sign_out
    redirect_to root_path
  end
end
