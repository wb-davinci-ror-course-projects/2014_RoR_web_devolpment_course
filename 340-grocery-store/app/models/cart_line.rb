class CartLine < ActiveRecord::Base
  belongs_to :product
  
def line_price 
  self.quantity * self.product.price_per_item
end

end
