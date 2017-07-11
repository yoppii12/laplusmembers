class UsersController < ApplicationController
  def new
    #インスタンスを作成しておく
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
    
    #user_paramsを受け取りstatusモデルを作成してインスタンスに代入
    @status= Status.new(user_params)
    
  end
  
  def show
    @user = User.find(params[:id])
    
    #株価表示
    @Title = "Stock Datas"
    @datas = Stock.where(code: @user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
