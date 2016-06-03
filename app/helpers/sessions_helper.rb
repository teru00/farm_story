module SessionsHelper
  
  #一時セッション
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #セッションの永続化
  def remember(user)
    #cookieに保存
    cookie.permanent.signed[:user_id] = user.id
    cookie.permanent[:remember_token] = user.remember_token
  end
  
  #現在のクライアントのステート参照
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
