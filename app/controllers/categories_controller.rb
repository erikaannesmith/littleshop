class CategoriesController < ApplicationController


  def show
    @category = Category.find_by(slug: params[:slug])
    if @category.nil?
      render_404
    end
    @items = @category.items.all
  end
  
end
