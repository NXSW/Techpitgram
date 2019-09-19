class Post < ApplicationRecord
  belongs_to :user_id
  mount_uploader :image, ImageUploader
end
