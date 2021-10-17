class User < ApplicationRecord
  validates :nickname, presence: true
  validates :email, presence: true
  validates :image_url, presence: true
  validates :token, presence: true
end
