class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create()
    @cart.create_order_items(@order)
    @order.update(total_price: OrderItem.total_price_of_order(@order))
    @order.update(user_id: current_user.id)
    flash[:notice] = "Order was successfully placed"

    redirect_to orders_path
  end

end
