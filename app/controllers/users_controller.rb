class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Welcome!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

end
