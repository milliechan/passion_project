class Hashpost < ActiveRecord::Base
  belongs_to :hashtags, foreign_key: :hash_id, class_name: "Hashtag"
  belongs_to :posts 
end

