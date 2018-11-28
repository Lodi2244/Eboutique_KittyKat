class CartsController < ApplicationController


  def show
  	@cart = Cart.find((User.find(current_user.id)).cart.id)
    @total_cart = 0
	@item = Item.all
	@item.each do |item|
	  if(item.carts.ids == @cart.id)
	    @total_cart += item.price
	  end
	end
  end
end
