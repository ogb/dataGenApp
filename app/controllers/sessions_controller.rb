class SessionsController < ApplicationController

  #displays login form ( new.html.erb )
  def new
  end

  # POST login action
  def create
    @user = User.authenticate params[:email], params[:password]
    if @user
      session[:user_id] = @user.id
      #redirect_to profile_path(), :notice1 => 'Welcome back, '
      render 'users/show'
    else
      flash[:notice] = "Please enter valid information"
      render 'new'
      #redirect_to new_session_path, :alert => "BAD DATA!"
    end
  end

  # DELETE logout action
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
