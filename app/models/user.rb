class User < ApplicationRecord
  #after_commit :send_welcome_mail, on: create
  #after_commit :send_profile_update_notification, on: update
  #after_commit :remove_profile_data, on: destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
end


  def send_welcome_mail
    UserMailer.send_welcome_mail(email: email)
  end
