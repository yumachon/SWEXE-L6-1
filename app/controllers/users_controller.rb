class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(uid: params[:user][:uid], 
    password: params[:user][:password],
    password_confirmation: params[:user][:password_confirmation])
    if @user.valid? #validatesを実行してくれる
      flash[:notice] = 'userを追加しました'
      @user.pass = BCrypt::Password.create(params[:user][:password])
      @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end
