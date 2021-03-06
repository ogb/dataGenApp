class Upload < ActiveRecord::Base
  attr_accessible :directory, :name, :user_id

  belongs_to :user

  def self.save( uploadData, user_id )
    name = uploadData.original_filename
    directory = "#{Rails.root}/public/uploads"
    user_id = user_id
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(uploadData.read) }
  end

  def self.removeFile( path )
    FileUtils.rm(path)
  end

end
