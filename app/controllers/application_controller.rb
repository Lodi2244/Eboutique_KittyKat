class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :categories

  def categories
      @categories = Category.all
  end

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id

        logging_in
        # reload guest_user to prevent caching problems before destruction
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
  # if session[:guest_user_id] invalid
  rescue ActiveRecord::RecordNotFound
    session[:guest_user_id] = nil
    guest_user if with_retry
  end

  private

  # called (once) when the user logs in, in order to transfer the cart
  def logging_in
    guest = guest_user
    current_cart = current_user.cart

    # if guest exists and the current_user does not already have a pending cart from previous session
    # then save all items in current cart into its own cart

    unless guest.nil? || !current_cart.items.empty?
      guest_cart = guest.cart
      current_cart.items.destroy_all unless current_user.cart.items.empty?
      current_cart.items = guest_cart.items
      current_cart.save!
    end
  end

  def create_guest_user
    u = User.new(:email => "guest_#{Time.now.to_i}#{rand(100)}@example.com", :name => "guest"),
    # build cart upon new user creation, neccessary as validation will be ignored
    u.build_cart
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end

  def create
    super
    current_or_guest_user
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

  def update_quantity
    cart = current_or_guest_user.cart
    item = Item.find(params[:item_id])
    qty = params[:qty].to_i

    if qty > cart.items.where(id: item.id).count
      (qty - cart.items.where(id: item.id).count).times do |i|
        cart.items << item
        cart.save
      end
    elsif qty < cart.items.where(id: item.id).count
      del_item = cart.items.where(id: item.id).first
      cart.items.delete(del_item)
      qty.times do |i|
        cart.items << item
        cart.save
      end
    end

    @sum = cart.items.sum(:price)
    respond_to do |f|
      f.html {redirect_to cart_path}
      f.js
    end
  end
end
