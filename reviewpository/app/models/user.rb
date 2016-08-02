class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates :password, :confirmation => true
  validates :email, :presence => true

  has_secure_password
end
