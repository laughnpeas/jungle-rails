class ApplicationMailer < ActionMailer::Base
  default from: "noreply@jungle.com"
  layout 'mailer'
end
# app/mailers/order_mailer.rb

class OrderMailer < ApplicationMailer
end