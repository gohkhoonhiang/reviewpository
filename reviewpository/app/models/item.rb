class Item < ApplicationRecord
  has_many :stakeholders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :category, :presence => true
  validates :name, :presence => true
  validates :stakeholder, :presence => true

  mount_uploader :image, ItemImageUploader

  attr_accessor :stakeholder
end
