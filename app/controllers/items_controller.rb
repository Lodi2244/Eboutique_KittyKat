class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @random_items = Item.all.sample(3)
  end

  def add_to_cart
    @item = Item.find(params[:id])
      if current_user.nil?
	       print("ok \n")
      flash[:alert] = "You must log in to add an item to your cart"
      redirect_to item_path(params[:id])
      else
	       print("\n\n\n\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #{params[:id]} \n")
     current_user.cart.items << @item
     flash[:success] = 'Item successfully added to cart!'
     redirect_to item_path(params[:id])
    end
  end

  def total_price
    @total_cart = 0
  end

  private
  def item_params
    params.require(:items).permit(:id)
  end
end
