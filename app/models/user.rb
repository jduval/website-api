require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :name, :presence    => true,
                   :uniqueness  => true

  # using gem email_validator
  validates :email, :presence     => true,
                    :uniqueness   => true,
                    :confirmation => true,
                    :email        => true

  validates :password, :presence     => true,
                       :length       => { :minimum => 5 },
                       :confirmation => true

  # FIXME BCrypt
  #before_save :encrypt_password

  #def password
    #@password ||= Password.new(password)
  #end

  #def password=(new_password)
    #@password = Password.create(new_password)
    #self.password = @password
  #end
end
