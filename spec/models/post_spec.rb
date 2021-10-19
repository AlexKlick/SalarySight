require 'rails_helper'

RSpec.describe Post do
  describe 'relationships' do 
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:year_graduated) }
    it { should validate_presence_of(:previous_education) }
    it { should validate_presence_of(:years_of_experience) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:dev_title) }
    it { should validate_presence_of(:type_of_employment) }
    it { should validate_presence_of(:location_of_employment) }
    it { should validate_presence_of(:negotiation) }
  end
end
