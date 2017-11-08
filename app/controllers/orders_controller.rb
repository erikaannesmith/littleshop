class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    user = User.find(params[:user_id])
    if (current_user == user) || (current_user.admin?)
      @order = Order.find(params[:id])
    else
      render_404
    end
  end

  def create
    @order = Order.create()
    @cart.create_order_items(@order)
    @order.update(total_price: OrderItem.total_price_of_order(@order))
    @order.update(user_id: current_user.id)
    flash[:notice] = "Order was successfully placed"
    @cart.contents.clear
    redirect_to orders_path
  end

end
