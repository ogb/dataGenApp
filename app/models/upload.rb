class Upload < ActiveRecord::Base
  attr_accessible :directory, :name

  belongs_to :user
end
