class UserMailer < ApplicationMailer
  def welcome_email
    @user = User.last
    mail(to: 'son.thach011011@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
