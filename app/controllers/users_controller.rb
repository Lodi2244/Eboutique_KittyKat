class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
  end 

  def create
   @user = User.new(params[:user])

   respond_to do |format|
     if @user.save
       UserMailer.with(user: @user).welcome_email.deliver_now

       format.html { redirect_to(@user, notice: 'User was successfully created.') }
       format.json { render json: @user, status: :created, location: @user }
     else
       format.html { render action: 'new' }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end
  end
  
  def log_out
  	@user = session[:user_id] = nil
	redirect_to _url
  end

end
