class UserMailer < ActionMailer::Base
  default from: "test-diplom-1@yandex.ru"

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
