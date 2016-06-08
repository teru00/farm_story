class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end
  
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    flash[:info] = "カートをカラにしました。"
    redirect_to store_path
  end
end
