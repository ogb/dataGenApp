class UsersController < ApplicationController

  before_filter :checkSession, only: [:show]
  
  def new
    @user = User.new
  end

#
 # def create
  #  @user = User.new params[:user]
   # if @user.save
    #  session[:user_id] = @user.id
     # redirect_to root_url, :notice => "Welcome!"
#    else
 #     render 'new'
  #  end
#  end

  def show
    userSession = User.find_by_id(session[:user_id])
    userParams = User.find_by_email(params[:email])
    if userSession.id != userParams.id
      redirect_to root_path
    else
      @user = userParams
    end
 
  end

end
