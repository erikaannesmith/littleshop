class Admin::OrdersController < Admin::BaseController

  def cancel
    order = Order.find(params[:format])
    order.update(status: "Cancelled")
    
    redirect_to admin_dashboard_path
  end

end
