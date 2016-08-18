=begin
If cart is there, find the cacrt using fin(session[:cart_id])
If it is not there, create a new cart and index it with the id :cart_id
=end
module CurrentCart
    extend ActiveSupport::Concern 
    private
    def set_cart
        @cart=Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        @cart=Cart.create
        session[:cart_id]=@cart.id
    end
end
