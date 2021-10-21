class Post < ApplicationRecord
  # belongs_to :user

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

  enum program: {backend: 0, frontend: 1}
  enum first_position: {yes: 0, no: 1}
  enum type_of_employment: {part_time: 0, full_time: 1, contract: 2, internship: 3}
  enum location_of_employment: {in_person: 0, hybrid: 1, remote: 2}
  enum  negotiation: {true: 0, false: 1}
end
