class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cellphone, :email, :birthdate, presence: true
end
