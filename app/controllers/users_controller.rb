class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
<<<<<<< HEAD
  end
=======
  end 
>>>>>>> e121d823165e72d695eb57c5dc5a826da2e6da41

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
end
