class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  def hello
    render text: 'hello, world'
  end

  private
    
    #cartのステートを参照する
    #ステートが初期値ならセッションを作成する
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      #session[:cart_id] = (Cart.create).id
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
