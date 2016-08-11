class Song < ActiveRecord::Base
  belongs_to :user 
  validates :title, :url, presence: true 

end
