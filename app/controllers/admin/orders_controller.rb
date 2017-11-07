class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
    @user = User.find(@order.user_id)
  end

  def modify
    order = Order.find(params[:format])
    order.change_status(params[:modify_type])

    redirect_to admin_dashboard_path
  end
  
end

