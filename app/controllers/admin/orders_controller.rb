class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
    @user = User.find(@order.user_id)
  end

end