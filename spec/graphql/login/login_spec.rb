require 'rails_helper'

 RSpec.describe 'login api', type: :request do
   before(:each) do
     @code = "9d06ebfcec574c793c1e"
   end

   it 'can create a new user from a github code', :vcr do
     post '/graphql', params: { query: query }

     expect(response).to be_successful

     user = JSON.parse(response.body, symbolize_names: true)

     expect(user).to have_key(:data)
     expect(user[:data][:createUser][:user]).to have_key(:nickname)
     expect(user[:data][:createUser][:user]).to have_key(:imageUrl)
     expect(user[:data][:createUser][:user]).to have_key(:token)
   end

   def query
     <<~GQL
     mutation {
       createUser(input: {
         code: "#{@code}"
       }) {
         user {
       nickname
       email
       imageUrl
       token
      }
     }
   }
   GQL
   end
 end
