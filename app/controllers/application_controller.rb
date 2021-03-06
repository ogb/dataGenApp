class ApplicationController < ActionController::Base
  protect_from_forgery

  def currentUser
    @currentUser ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :currentUser

  def checkSession
    if nil == currentUser
      redirect_to root_path
    end
  end

  def checkSessionTime
    if Time.now >= (session[:exp_time] + 60*5) 
      redirect_to logout_path
    end
  end

end
