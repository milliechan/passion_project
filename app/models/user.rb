class User < ActiveRecord::Base
  include BCrypt

  has_many :posts, foreign_key: :author_id
  has_many :follows, foreign_key: :user_id 
  has_many :follows, foreign_key: :celebrity_id 

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
  	self.password == input_password
  end

end
