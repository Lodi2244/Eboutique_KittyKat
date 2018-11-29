class CartsController < ApplicationController

  def initialize
  	if(current_user != nil)
  	 @cart = Cart.find((User.find(current_user.id)).cart.id)
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

  def show
  end

  def method_name
  end
end
