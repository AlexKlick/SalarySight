class Salary < ApplicationRecord
  def self.median_salary
    average(:salary)
  end
end
