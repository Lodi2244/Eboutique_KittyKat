class CartsController < ApplicationController
  before_action :authenticate_user!

  def create
    @carts = Cart 
  end

  def show
  	@cart = current_user.cart
    @total_cart = 0
	  @item = Item.all
	  @item.each do |item|

	     if(item.carts.ids == @cart.id)
	        @total_cart += item.price
	       end
	     end
  end
end
