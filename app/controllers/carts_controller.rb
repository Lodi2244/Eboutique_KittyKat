class CartsController < ApplicationController

  def new
    if(current_user != nil)
  	   @cart = current_user.cart
	elsif(current_user)
	  @cart = Cart.new(user_id: current_user.id)
	  if(@cart.save)
	    flash[:info] = "Connexion done"
	    redirect_to root_url
	  else
	    flash[:info] = "Error please try again"
	    #redirect_to
	  end
    else
	  flash[:info] = "Error please try again"
	  #redirect_to
    end
  end

  def cart
    @cart = current_user.cart
  end

  def show

    @total_cart = 0
	  @items = Item.all
	  @items.each do |item|

	  if(item.carts.ids == @cart.id)
	    @total_cart += item.price
	  end
	 end


  end
end
