require 'rails_helper'

RSpec.describe Post do
  # describe 'relationships' do
  #   it { should belong_to(:user) }
  # end

  describe 'validations' do
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:grad_year) }
    it { should validate_presence_of(:degree) }
    it { should validate_presence_of(:years_of_experience) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:position_title) }
    it { should validate_presence_of(:type_of_employment) }
    it { should validate_presence_of(:location_of_employment) }
    it { should validate_presence_of(:negotiation) }
    it { should define_enum_for(:program).with(['BE', 'FE']) }
    it { should define_enum_for(:first_position).with(['Yes', 'No']) }
    it { should define_enum_for(:type_of_employment).with(['Part-Time', 'Full-Time', 'Contract', 'Intern/Apprentice']) }
    it { should define_enum_for(:location_of_employment).with(['In-Person', 'Hybrid', 'Remote']) }
  end
end
