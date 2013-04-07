class UploadsController < ApplicationController

  before_filter :checkSession, only: [:create, :destroy]
  before_filter :checkSessionTime, only: [:create, :destroy]
  
  # create should place stuff in the DB
  def create
    userSession = User.find_by_id(session[:user_id])
   # userParams = User.find_by_email(params[:email])
   # if userSession.id != (userParams.id if userParams)
      uploadData = params[:uploadFile]
      (uplf = Upload.save(uploadData, userSession.id)) if uploadData
      if uplf
        # save dem infos to dat database
        @upload = Upload.new( :user_id => session[:user_id] )
        @upload.name = uploadData.original_filename
        @upload.directory = File.join("#{Rails.root}/public", "uploads")
        @upload.save
        flash[:notice] = "file uploaded"
        redirect_to profile_path
      else
        flash[:notice] = "file not uploaded"
        redirect_to profile_path 
      end
   # end
  end  

  def destroy
    file = Upload.find_by_id(params[:id])
    Upload.removeFile(File.join(file.directory, file.name))
    file.destroy
    flash[:notice] = "file deleted"
    redirect_to(profile_path( User.find_by_id(session[:user_id]).email))
  end

end
