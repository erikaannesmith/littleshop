class Admin::OrdersController < Admin::BaseController

  def modify
    order = Order.find(params[:format])
    order.change_status(params[:modify_type])

    redirect_to admin_dashboard_path
  end

end
