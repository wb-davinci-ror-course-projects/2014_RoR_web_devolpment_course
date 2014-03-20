class MainController < ApplicationController

  def order_form
    @order = SubOrder.new
    render :order_form and return
  end

  def place_order
    @order                = SubOrder.new
    @order.sandwich_type  = params[:sandwich_type]
    @order.bread_type     = params[:bread_type]
    price = 3.49
    @order.is_twelve_inch = params[:is_twelve_inch]
      if @order.is_twelve_inch == true
        price1 = price + 2.00
      else
        price1 = price
      end
    @order.has_extra_meat = params[:has_extra_meat]
      if @order.has_extra_meat == true
        price2 = price1 + 0.49
      else
        price2 = price1
      end
    @order.has_chips      = params[:has_chips]
      if @order.has_chips == true
        price3 = price2 + 0.99
      else
        price3 = price2
      end
    @order.total_price    = price3
    @order.created_at     = params[:created_at]
    @order.updated_at     = params[:updated_at]
      if @order.save == false
        render "order_form" and return
      else
        render :thank_you and return
      end
  end

  def list_orders
    @orders = SubOrder.all
    render :list_orders and return
  end

end
