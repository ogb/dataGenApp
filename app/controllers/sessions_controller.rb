


class SessionsController < ApplicationController

  #displays login form ( new.html.erb )
  def new
    puts "HELLO SERVER TEXT WATCHER"
    # this simply renders the following text. The view new.html.erb never gets rendered with the following statement.
    # render :text => "IM FROM THE NEW ACTION !"

    # aite, lets redirect the user to current user
    if nil != currentUser
      redirect_to profile_path(currentUser.email)
    end
  end

  # POST login action
  def create
    user = User.authenticate params[:email], params[:password]
    if user # then validate user
      session[:user_id] = user.id
      session[:exp_time] = Time.now 
      redirect_to profile_path(user.email)
    else
      flash[:notice] = "Please enter valid information"
      redirect_to new_session_path
    end
  end

  # DELETE logout action
  def destroy
    session[:user_id] = nil
    session[:exp_time] = nil
    redirect_to root_url
    puts "DESTROY SESSION"
  end

end
