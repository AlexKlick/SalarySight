class Post < ApplicationRecord
  belongs_to :user

  validates :gender, presence: true
  validates :age, presence: true
  validates :grad_year, presence: true
  validates :degree, presence: true
  validates :years_of_experience, presence: true
  validates :state, presence: true
  validates :salary, presence: true
  validates :position_title, presence: true
  validates :type_of_employment, presence: true
  validates :location_of_employment, presence: true
  validates :negotiation, presence: true
end
