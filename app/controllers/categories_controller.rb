class CategoriesController < ApplicationController


  def show
    @category = Category.find_by(slug: params[:slug])
    if @category.nil?
      not_found
    end
    @items = @category.items.all
  end

end
