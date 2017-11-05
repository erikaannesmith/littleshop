class Admin::DashboardController < Admin::BaseController

  def index
    @orders = all_orders
  end

  private

  def all_orders
    @orders = Order.all
  end
end
