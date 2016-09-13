class OrderNotifier < ActionMailer::Base
  default from: 'Varunram Ganesh' "deimos@mars.gov"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'Dummy Flipkart Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
      @order=order
      mail to: order.email, subject: 'Dummy Flipkart Order Shipped'
  end
end
