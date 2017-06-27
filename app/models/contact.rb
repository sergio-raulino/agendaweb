class Contact < ApplicationRecord
  has_paper_trail
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cellphone, :email, :birthdate, presence: true

  belongs_to :user
end
