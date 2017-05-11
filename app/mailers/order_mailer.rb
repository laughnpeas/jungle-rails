class OrderMailer < ApplicationMailer
  default from: 'noreply@jungle.com'

  def order_email(order)
    @order = order
    mail(to: order.email, subject: 'Your order has successfully placed - order# '+order.id.to_s )
  end
end
