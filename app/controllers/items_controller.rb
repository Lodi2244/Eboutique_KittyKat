class ItemsController < ApplicationController
  
  def intialize
	  if(current_user)
	   @cart = Cart.find(current_user.cart.id)
	  else
	    @cart = nil
	  end
  end
  
  def index
    @items = Item.all
  end

  def total_price
    @total_cart = 0
	@items = Item.all
	@items.each do |item|
	  if(item.carts.ids == @cart.id)
	    @total_cart += item.price
	  end
	end
  end

  def add_to_cart
  	@item = Item.find(params[:id])
    if(current_user)
	  @item.carts << @cart
    end
  end
end
