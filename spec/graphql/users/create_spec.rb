require 'rails_helper'

RSpec.describe 'User create', type: :request do
  describe 'When a new user logs in with OAuth' do

    it 'creates new user' do
      post '/graphql', params:{ query: mutation }
      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:createUser][:user]).to have_key(:nickname)
      expect(user[:data][:createUser][:user]).to have_key(:email)
      expect(user[:data][:createUser][:user]).to have_key(:imageUrl)
      expect(user[:data][:createUser][:user]).to have_key(:token)
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
