class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :item

  validates :title, :presence => true
  validates :content, :presence => true
  validates :star, :presence => { :message => "Rating can't be blank" }
end
