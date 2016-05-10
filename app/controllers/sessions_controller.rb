class SessionsController < ApplicationController

  def new

  end

  def create
    # require 'pry'
    # binding.pry
    user = User.find_by_user_name(params["/sessions/new"][:user_name])
    if user && user.authenticate(params["/sessions/new"][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'sessions/new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end