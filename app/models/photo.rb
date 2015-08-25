class Photo < ActiveRecord::Base
  attr_accessible :title, :bytes, :image, :image_cache, :public_id, :user_id
   mount_uploader :image, ImageUploader
  
  validates_presence_of :title, :image
  has_many :votes
  belongs_to :user
end
