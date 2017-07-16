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
    
  end
  
  def update
    @user = User.find(user_params[:id])
    @emergency = Emergency.find(user_params[:id])
    @emergency.update_attribute(status: status_id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
