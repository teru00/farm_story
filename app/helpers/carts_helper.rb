module CartsHelper
  #cartのステートを参照する
  #ステートが初期値ならセッションを作成する
  def current_cart
    @current_cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    #session[:cart_id] = (Cart.create).id
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
