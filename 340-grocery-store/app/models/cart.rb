class Cart < ActiveRecord::Base
  belongs_to :ship_method
  has_many :cart_lines
  
def ship_price_total
  @cart = Self.find_by(cart_id: session[:cart_id])
  ship_total = @cart.ship_method.price_per_cart
  @cart.cart_lines.each do |line|
  ship_total = ship_total + self.quantity * @cart.ship_method.price_per_item
  end
end

end
