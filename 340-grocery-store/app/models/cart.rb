class Cart < ActiveRecord::Base
  belongs_to :ship_method
  has_many :cart_lines

  def ship_price
    total = self.ship_method.price_per_cart
    self.cart_lines.each do |line|
      total = total + self.ship_method.price_per_item * line.quantity
    end
    total
  end

  def total_price
    total = 0.00
    self.cart_lines.each do |line|
      total += line.line_price
    end
    total += self.ship_price
    total
  end
end
