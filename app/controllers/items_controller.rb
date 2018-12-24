class ItemsController < ApplicationController

  def index
    @items = Item.all
    @categories = Category.all
  end

  def cart
    @cart = current_or_guest_user.cart
  end

  def show
    @item = Item.find(params[:id])
  end

  def add_to_cart
    @item = Item.find(params[:id])
    current_or_guest_user.cart.items << @item
    flash[:success] = 'Item successfully added to cart!'
    redirect_to item_path(params[:id])
    end
  end

  def total_price
    @total_cart = 0
  end
