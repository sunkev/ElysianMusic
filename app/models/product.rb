class Product < ActiveRecord::Base
  validates_presence_of :brand
  validates_presence_of :model
  validates_presence_of :price

  mount_uploader :product_photo, ProductPhotoUploader
end