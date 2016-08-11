class User < ActiveRecord::Base
  has_many :songs 

  validates :email, :password_hash, presence: true 

end
