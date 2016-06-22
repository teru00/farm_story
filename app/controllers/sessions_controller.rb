class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "ログインが完了しました。"
      #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash[:danger] = "ログインできませんでした。"
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
  end
  
end
