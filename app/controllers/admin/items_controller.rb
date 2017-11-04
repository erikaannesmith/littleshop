class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to items_path
    else
      redirect_to new_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id)
  end

end
