class UsersController < ApplicationController
  def new
    #インスタンスを作成しておく
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
       #アカウント作成時にuser_paramsを受け取りemergencyモデルを作成してインスタンスに代入
      @emergency= Emergency.new(name: user_params[:name],email: user_params[:email] )
      @emergency.save
      
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
    
    @status = Emergency.find(params[:id])
  end
  
  def update
    @emergency = Emergency.find(params[:id])
    @emergency.update_attribute = {:status = '1'}
    redirect_to @user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def status_params
    params.require(:status).permit(:name, :email, :status)
  end
  
end
