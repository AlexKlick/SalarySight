require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:token) }
    it { should validate_presence_of(:image_url) }
  end
end
