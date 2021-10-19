class Post < ApplicationRecord
  belongs_to :user

  validates :gender, presence: true
  validates :age, presence: true
  validates :year_graduated, presence: true
  validates :previous_education, presence: true
  validates :years_of_experience, presence: true
  validates :state, presence: true
  validates :salary, presence: true
  validates :dev_title, presence: true
  validates :type_of_employment, presence: true
  validates :location_of_employment, presence: true
  validates :negotiation, presence: true
end
