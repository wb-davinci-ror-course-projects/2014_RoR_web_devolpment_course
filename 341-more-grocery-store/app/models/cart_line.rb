class CartLine < ActiveRecord::Base
  belongs_to :product
  
  def line_price
    self.product.price_per_item * self.quantity
  end
  
end
