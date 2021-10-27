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

  enum program: { 'BE' => 0, 'FE' => 1 }
  enum first_position: { 'Yes' => 0, 'No' => 1 }
  enum type_of_employment: { 'Part-Time' => 0, 'Full-Time' => 1, 'Contract' => 2, 'Intern/Apprentice' => 3 }
  enum location_of_employment: { 'In-Person' => 0, 'Hybrid' => 1, 'Remote' => 2 }
end
