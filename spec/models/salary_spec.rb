require 'rails_helper'

RSpec.describe Salary do
  describe 'class methods' do
    describe '#median_salary' do
      it 'should calculate the median of all salaries' do
        salary1 = create(:salary)
        salary2 = create(:salary, salary: 120_000)
        salary3 = create(:salary, salary: 110_000)

        expect(Salary.median_salary).to eq(110_000)
      end
    end
  end
end
