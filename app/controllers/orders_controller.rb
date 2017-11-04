class OrdersController < ApplicationController

  def index
    @orders = Order.where(current_user: params[:user_id])
  end

  def create
    @order = Order.create(contents: @cart.contents)
  end

end