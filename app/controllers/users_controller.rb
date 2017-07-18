class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Laplusmembers!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    
    #株価表示
    @Title = "Stock Datas"
    @datas = Stock.where(code: @user)
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attribute(:status,  params[:status])
      redirect_to @user, notice: '取引ステータスを更新しました。'
    else
      render 'show'
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
