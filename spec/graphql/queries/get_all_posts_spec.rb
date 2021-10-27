require 'rails_helper'

RSpec.describe 'posts request API', type: :request do
  describe 'get all posts' do
    it 'can send a list of post data' do
      user = create(:user)
      post1 = create(:post)
      post2 = create(:post)

      response = SalarySightSchema.execute(query).as_json

      response['data']['posts'].each do |post|
        expect(post).to have_key('id')
        expect(post).to have_key('company')
        expect(post).to have_key('salary')
        expect(post).to have_key('degree')
        expect(post).to have_key('positionTitle')
        expect(post).to have_key('state')
        expect(post).to have_key('jobHuntDuration')
        expect(post).to have_key('gender')
        expect(post).to have_key('age')
        expect(post).to have_key('yearsOfExperience')
        expect(post).to have_key('typeOfEmployment')
        expect(post).to have_key('gradYear')
        expect(post).to have_key('locationOfEmployment')
        expect(post).to have_key('negotiation')
        expect(post).to have_key('firstPosition')
      end
    end

    def query
      <<~GQL
        query {
          posts {
            id
            company
            salary
            degree
            positionTitle
            state
            jobHuntDuration
            gender
            age
            yearsOfExperience
            gradYear
            typeOfEmployment
            locationOfEmployment
            firstPosition
            negotiation
          }
        }
      GQL
    end
  end

  describe 'get all posts with median salary data' do
    it 'can send a list of all post data including median salary data' do
      user = create(:user)
      post1 = create(:post)
      post2 = create(:post)

      post '/graphql', params: { query: query }

      expect(response).to be_successful

      posts = JSON.parse(response.body, symbolize_names: true)

      posts[:data][:posts].each do |post|
        expect(post).to have_key(:id)
        expect(post).to have_key(:company)
        expect(post).to have_key(:salary)
        expect(post).to have_key(:degree)
        expect(post).to have_key(:positionTitle)
        expect(post).to have_key(:state)
        expect(post).to have_key(:jobHuntDuration)
        expect(post).to have_key(:gender)
        expect(post).to have_key(:age)
        expect(post).to have_key(:yearsOfExperience)
        expect(post).to have_key(:typeOfEmployment)
        expect(post).to have_key(:gradYear)
        expect(post).to have_key(:locationOfEmployment)
        expect(post).to have_key(:negotiation)
        expect(post).to have_key(:firstPosition)
      end

      expect(posts[:data]).to have_key(:salary)
      expect(posts[:data][:salary]).to have_key(:medianSalary)
    end

    def query
      <<~GQL
        query {
          posts {
            id
            company
            salary
            degree
            positionTitle
            state
            jobHuntDuration
            gender
            age
            yearsOfExperience
            gradYear
            typeOfEmployment
            locationOfEmployment
            firstPosition
            negotiation
          }
          salary {
          medianSalary
           }
        }
      GQL
    end
  end
end

# "medianSalary": 95000
