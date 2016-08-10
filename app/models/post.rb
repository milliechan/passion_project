class Post < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id, class_name: "User"
  has_many :hash_posts, foreign_key: :post_id 
end
