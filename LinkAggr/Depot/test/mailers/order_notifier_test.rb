require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Flipkart Confirmation", mail.subject
    assert_equal ["deimos@mars.gov"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Night Of The Living Dummy/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Flipkart Order Shipped", mail.subject
    assert_equal ["deimos@mars.gov"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td>1&times;</td>\s*<td>Night Of The Living Dummy<\/td>/,      mail.body.encoded
  end
end
