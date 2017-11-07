class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
  end

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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :status, :category_id)
  end

end
