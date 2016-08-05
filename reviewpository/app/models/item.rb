class Item < ApplicationRecord
  has_many :stakeholders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user

  mount_uploader :image, ItemImageUploader
end
