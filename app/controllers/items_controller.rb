class ItemsController < ApplicationController
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
end
