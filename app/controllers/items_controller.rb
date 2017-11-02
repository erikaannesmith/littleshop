class ItemsController < ApplicationController

    def index
        @items = Item.all
        @categories = Category.all
    end

    def show

    end

end
