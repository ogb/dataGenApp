class ApplicationController < ActionController::Base
  protect_from_forgery

  def currentUser
    @currentUser ||= User.find(session[:user_id]) if session[:user_id]
  end

  def checkSession
    if nil == currentUser
      redirect_to root_path
  
    end
  end

end
