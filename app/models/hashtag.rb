class Hashtag < ActiveRecord::Base
  has_many :posts
end
