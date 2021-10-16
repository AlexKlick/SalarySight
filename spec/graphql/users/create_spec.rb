require 'rails_helper'

RSpec.describe 'User create', type: :request do
  describe 'When a new user logs in with OAuth' do

    it 'creates new user' do
      post '/graphql', params:{ query: mutation }
      user = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(user[:data][:user]).to have_key(:nickname)
      expect(user[:data][:user]).to have_key(:email)
      expect(user[:data][:user]).to have_key(:image_url)
      expect(user[:data][:user]).to have_key(:token)
    end
    def mutation
      <<~GQL
      mutation {
        createUser(input: {
          nickname: "example name"
          email: "example email"
          imageUrl: "example.example.com"
          token: "testblahqwe0ihfin2o3i"
        }){
        user{
          nickname,
          email,
          imageUrl,
          token
        }
        }
      }
      GQL
    end
  end
end