class SessionController < ApplicationController

  def new

  end

  def create
    user = User.find_by_user_name(params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end