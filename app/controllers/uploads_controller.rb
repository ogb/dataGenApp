class UploadsController < ApplicationController

  before_filter :checkSession, only: [:create, :destroy]
  before_filter :checkSessionTime, only: [:create, :destroy]

  @mainUploadsPath = ''
  
# create should place stuff in the DB
  def create
    userSession = User.find_by_id(session[:user_id])
    userParams = User.find_by_email(params[:email])
    if userSession.id != (userParams.id if userParams)
      uploadData = params[:upload]
    end

  end  

  def destroy
  end

end
