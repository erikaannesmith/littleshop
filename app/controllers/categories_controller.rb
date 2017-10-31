class CategoriesController < ApplicationController


  def show
    @category = Category.where(name: params[:name].downcase).first

    @items = @category.items.all
  end


end
