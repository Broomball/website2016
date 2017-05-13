class CarouselPicture < ApplicationRecord
  mount_uploader :picture, ImageUploader
end
