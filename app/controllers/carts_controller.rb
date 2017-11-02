class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your cart."
    redirect_to items_path
  end

  def show
    @items = @cart.contents.map { |f| Item.find(f[0].to_i) }
  end

  def remove
    @cart.remove_item(params[:item_id])
    item = Item.find(params[:item_id])

    flash[:notice] = "Successfully removed #{view_context.link_to item.title, item_path(item)} from your cart."

    redirect_to cart_path(@cart)
  end

  def add
    @cart.add_item(params[:item_id])

    redirect_to cart_path(@cart)
  end

end
