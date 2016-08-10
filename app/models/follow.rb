class Follow < ActiveRecord::Base
  belongs_to :users 
  belongs_to :users, foreign_key: :celebrity_id, class_name: "User" 
end
