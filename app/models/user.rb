class User < ApplicationRecord
  has_many :posts
  
  validates :nickname, presence: true
  validates :email, presence: true
  validates :image_url, presence: true
  validates :token, presence: true
end
