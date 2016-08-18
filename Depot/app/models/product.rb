class Product < ActiveRecord::Base
    validates :title, :description, :image_url, presence:true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates_length_of :title, minimum: 10, message: " should be having a minimum of ten charactes"
    validates :image_url, allow_blank:true, format: {
        with: %r{\.gif|jpg|jpeg|png\Z}i,
        messsage: "Given image must be of Jpeg/Png/Gif fromat only"
        } 
    def self.latest
        Product.order(:updated_at).last
    end
end
