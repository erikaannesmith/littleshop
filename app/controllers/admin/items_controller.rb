class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    binding.pry
  end

end
