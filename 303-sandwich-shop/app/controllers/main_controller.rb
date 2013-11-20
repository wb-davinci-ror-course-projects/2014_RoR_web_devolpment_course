class MainController < ApplicationController

  def order_form
    @order = SubOrder.new
    render :order_form and return
  end

  def place_order
    # TODO: Create a new SubOrder and render the thank you page if successful
    raise "TODO: start by removing this line"
  end

  def list_orders
    @orders = SubOrder.all
    render :list_orders and return
  end

end
