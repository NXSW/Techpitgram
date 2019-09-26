class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
end
