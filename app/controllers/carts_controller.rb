class CartsController < ApplicationController

  def new
  	@cart = current_user.cart

  end

  def show

    @total_cart = 0
	  @items = Item.all
	  @items.each do |item|

	  #if(item.cart.id == @cart.id)
	    @total_cart += item.price
	  end
	 end

   def delete_item
     cart_items = current_or_guest_user.cart.items
     item = cart_items.where(id: params[:id])
     cart_items.delete(item)

     @sum = cart_items.sum(:price)
     respond_to do |f|
       f.html {redirect_to cart_path}
       f.js
     end
   end
 end
#end
