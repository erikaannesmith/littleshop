class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      
      flash[:notice] = "Logged in as #{@user.username}"
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
    return render_404 if @user != current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :address, :full_name)
  end
end
