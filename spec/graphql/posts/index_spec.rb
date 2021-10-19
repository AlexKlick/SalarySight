require 'rails_helper'

RSpec.describe 'posts request API' do
  it 'can send a list of post data' do
    user = create(:user)
    post1 = create(:post, user: user)
    post2 = create(:post, user: user)

    response = SalarySightSchema.execute(query).as_json

    response['data']['posts'].each do |post|
      expect(post).to have_key('id')
      expect(post).to have_key('company')
      expect(post).to have_key('salary')
      expect(post).to have_key('previousEducation')
      expect(post).to have_key('devTitle')
      expect(post).to have_key('state')
      expect(post).to have_key('jobHuntDuration')
      expect(post).to have_key('gender')
      expect(post).to have_key('age')
      expect(post).to have_key('yearsOfExperience')
    end
  end

  def query
    <<~GQL
    query {
      posts {
        id
        company
        salary
        previousEducation
        devTitle
        state
        jobHuntDuration
        gender
        age
        yearsOfExperience
      }
    }
    GQL
  end
end
