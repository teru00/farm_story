class Product < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :owner
end
