class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    session[:user_id] = user.id
    if user && user.authenticate(params[:session][:password]) && current_admin?
      redirect_to admin_dashboard_path
    elsif user && user.authenticate(params[:session][:password])
      redirect_to dashboard_path
      flash[:notice] = "Logged in as #{current_user.username}"
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end


end
