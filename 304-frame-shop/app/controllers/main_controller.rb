class MainController < ApplicationController
 
def index
  @order = OrderedFrame.new
  render :index and return 
end

def thank_you
  render :thank_you and return
end

def place_order
  id = params[:id]
  @order = OrderedFrame.new
  @order.frame_id = params[:id]
  old = Frame.find(id)
  @order.material = old.material
  @order.price = old.price
  @order.inches = params[:inches]
  @order.hardware = params[:hardware]
   if @order.hardware == "true"
    @order.total_price = @order.price + 0.50
   else
    @order.total_price = @order.price
   end
   if @order.inches > 0 
   @order.total_price = @order.total_price + @order.inches
   else
    @order.total_price = @order.total_price
   end
  
  if @order.save == false
    render :index and return
  else
    render :thank_you and return
  end
end

end