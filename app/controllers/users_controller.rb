class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      render_404
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :address, :full_name)
  end
end
