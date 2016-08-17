require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "product attributes must not be empty" do
      assert product.invalid?
      assert product.errors[:price].any?
      assert product.errors[:description].any?
      assert product.errors[:image_url].any?
      assert product.errors[:title].any?
  end
 test "product price must be positive" do
 product = Product.new{title: "My Book title",
                       description: "Random",
                       image_url: "Random.jpg"}
 product.price = -1
 assert product.invalid?
 assert_equal ["Price must be Positive"],
     product.errors[:price]
 product.price = 0
 assert products.valid?
 assert_equal["Price cannot be Zero"],
     product.error[:price]
 product.price = 1
 assert product.valid?
 end
 def new product(image_url)
     Product.new{
         title: "Random1"
         description: "A random description"
         image_url: image_url
         price: 1.00
         }
 end
 test="image.url" do
     ok = %w{ fred.gif fred.jpg fred.png FRED.jpg FRED.Jpg http://a.b.c/x/y/z/fred.gif }
     bad = %w{ fred.doc fred.txt fred.gif/more fred.gof.more}
     for ok.each do
         assert new_product(name).valid? "#{name} should be valid"
     end
     for bad.each do
         assert new_product(name).valid? "#{name} should be invalid"
     end
 end
 test "product is not valid without an unique title" do
     Product.new{
         title: "Random1"
         description: "A random description"
         image_url: image_url
         price: 1.00
         }
     assert product.invalid?
     assert_equal["product's name is not unique"], product.error[:title]
 end
end