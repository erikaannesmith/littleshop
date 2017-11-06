class Admin::DashboardController < Admin::BaseController

  def index
    @orders = choose_orders
  end

  private

  def choose_orders
    if order_filter = params[:order_type]
      @orders = Order.where(status: order_filter)
    else
      @orders = Order.all
    end
  end

end
