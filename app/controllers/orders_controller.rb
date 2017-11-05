class OrdersController < ApplicationController

  def index
    @orders = Order.where(current_user: params[:user_id])
  end

  def create
    @order = Order.create()
    @cart.create_order_items(@order)
    @order.update(total_price: OrderItems.total_price_of_order(@order))
    @order.update(user_id: current_user.id)
    flash[:notice] = "Order was successfully placed"

    redirect_to order_path
  end

end
