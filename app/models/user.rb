class User < ActiveRecord::Base
  # comment plz!

  attr_accessible :email, :password, :salt, :password_confirmation

  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :confirmation => true

  before_save :encrypt_password

  has_many :uploads, :dependent => :destroy

  def self.authenticate email, password
    user = find_by_email email
    returnVal = false
    if user and (user.password == (BCrypt::Engine.hash_secret(password, user.salt)))
      returnVal = user
    else
      returnVal = false
    end
    return returnVal
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret password, salt
      self.password_confirmation = BCrypt::Engine.hash_secret self.password, salt
    end
  end

end
