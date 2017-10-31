class CategoriesController < ApplicationController


  def show
    @category = Category.where(name: params[:name]).first
  end


end
