class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def cart
    @cart = current_user.cart
  end

  def show
    @item = Item.find(params[:id])

  end

  def add_to_cart
    @item = Item.find(params[:id])
    current_user.cart.items << @item
    flash[:success] = 'Item successfully added to cart!'
    #redirect_to item_path(params[:id])
    end
  end

  def total_price
    @total_cart = 0
  end

  private
  def item_params
    params.require(:items).permit(:id)
  end
