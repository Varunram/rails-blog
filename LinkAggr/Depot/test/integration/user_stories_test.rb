require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
    LineItem.delete_all
    Order.delete_all
    slappy_book = products(:slappy)
    # User goes to store index page
    get"/"
    assert_response :success
    assert_template "index"
    #User adds an item to the cart via Ajax
    xml_http_request :post, '/line_items', product_id: slappy_book.id
    assert_response :success
    
    cart=Cart.find(session[:cart_id])
    assert_equal 1,cart.line_items.size
    assert_equal slappy_book, cart.line)items[0].product
    #User Checks Out
    get"/orders/new"
    assert_response :success
    assert_template "new"
    
    post_via_redirect"/orders", 
                order:{ name: "Varunram Ganesh",
                        address: "123 Pennsylvania Ave.",
                        EMAIL: "mars@mars.gov",
                        pay_type: "Check"}
    assert_response :success
    assert_template "index"
    cart=Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    orders=Order.all
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal "Varunram Ganesh", order.name
    assert_equal "123 Pennsylvania Ave.", order.address
    assert_equal "mars@mars.gov", order.email
    assert_equal "Check", order.pay_type

    mail=ActionMailer::Base.deliveries.last
    assert_equal ["mars@mars.gov"], mail.to
    assert_equal 'Varunram Ganesh <deimos@mars.gov>', mail[:from].value
    assert_equal "Flipkart Order Confirmation", mail.subject
  end
end
