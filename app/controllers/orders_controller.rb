class OrdersController < ApplicationController
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_path, notice: "カートが空です"
      return
    end
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to store_path, notice: "ご注文ありがとうございました"
    else
      render 'new'
    end
  end
  
  private
    def order_params
      params.require(:order).permit(:name,:address,:email,:pay_type)
    end
end
