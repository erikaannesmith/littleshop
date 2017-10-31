class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      
    else
      redirect_to admin_item_new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end

end
