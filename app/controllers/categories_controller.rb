class CategoriesController < ApplicationController
  def index
    @categories = Category
    @active_cart = 0
    @all_items = Item
      if params[:id].nil?
        @active_cart = 0
        @items = Item
  end

  def update
    @all_items = Item
    @categories = Category
    @active_cart = params[:id]
    @items = (@active_cart.to_i == 0) ? Item : Item.where(category_id: @active_cart)

    respond_to do |f|
      f.html {redirect_to items_path}
      f.js
    end
  end
end
