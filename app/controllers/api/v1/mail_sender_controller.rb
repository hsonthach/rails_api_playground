class Api::V1::MailSenderController < ApplicationController
  def create
    UserMailer.welcome_email.deliver_later
  end
end
