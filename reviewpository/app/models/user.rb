class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, :presence => true, :uniqueness => true, on: :create
  validates :password, :presence => true, on: :create
  validates :password_confirmation, :presence => true, on: :create
  validates :password, :confirmation => true, on: :create
  validates :email, :presence => true, on: :create

  validate :email_update, :password_update, on: :update

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  attr_accessor :old_password

  def email_update
    if !email.nil? && !email.empty?
      old = User.find(id)
      if email != old.email
        if old_password.nil? || old_password.empty?
          errors.add(:old_password, "can't be blank")
        else
          if !old.authenticate(old_password)
            errors.add(:old_password, "doesn't match")
          end
        end
      end
    else
      errors.add(:email, "can't be blank")
    end
  end

  def password_update
    if !password.nil? && !password.empty?
      old = User.find(id)
      if old_password.nil? || old_password.empty?
        errors.add(:old_password, "can't be blank")
      else
        if !old.authenticate(old_password)
          errors.add(:old_password, "doesn't match")
        else
          if password != password_confirmation
            errors.add(:password, "doesn't match Password confirmation")
            errors.add(:password_confirmation, "doesn't match Password")
          end
        end
      end
    end
  end
end

