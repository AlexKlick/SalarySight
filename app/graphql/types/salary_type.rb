module Types
  class SalaryType < Types::BaseObject
    field :median_salary, Integer, null:true

    def median_salary
      object.median_salary
    end
  end
end
