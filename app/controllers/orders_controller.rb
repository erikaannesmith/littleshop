class OrdersController < ApplicationController

  def index
    @orders = Order.where(current_user: params[:user_id])
  end

  def create
    # byebug
    @order = Order.create()
    # item = Item.find(params[:item_id])
    # oi = OrderItems.create(order: @order,
    #                        item: item,
    #                        historical_price: item.price,
    #                        quantity: @cart.contents[item.id.to_s])

# ******ITEM ID IS A STRING
    @cart.contents.each do |item_id, quantity|
      orderitem = OrderItems.create(order: @order,
                        item_id: item_id,
                        historical_price: Item.find(item_id).price,
                        quantity: quantity)
    
      orderitem.update(inline_total: (orderitem.historical_price * orderitem.quantity)) 
    end    

    @order.total_price = OrderItems.total_price(@order)

    @order.user_id = current_user.id
    
  end

end