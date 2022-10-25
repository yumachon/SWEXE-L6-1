class TopController < ApplicationController
  def main
    render 'login'
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.pass) == params[:pass]
      flash[:notice] = 'ログインしました'
      session[:login_uid] = user.uid
      redirect_to root_path
    else
      flash[:notice] = 'ログインエラー'
      render 'login'
    end
  end

  def logout
   flash[:notice] = 'ログアウトしました'
    session.delete(:login_uid)
    redirect_to root_path
  end
end
