class ItemsController < ApplicationController
  #before_action :authenticate_user!
  def index
    @items = Item.all
  end

<<<<<<< HEAD
  def show
    @item = Item.find(params[:id])
    @random_items = Item.all.sample(3)
  end

  def add_to_cart
    @item = Item.find(params[:id])

    if current_user.nil?
      flash[:alert] = "You must log in to add an item to your cart"
      redirect_to item_path(params[:id])
    else
      current_user.cart.items << @item
      flash[:success] = 'Item successfully added to cart!'
      redirect_to item_path(params[:id])
    end
=======
  def total_price
    @total_cart = 0
	@items = Item.all
	@items.each do |item|
	  if(item.carts.ids == @cart.id)
	    @total_cart += item.price
	  end
	end
>>>>>>> show_panier
  end
end
