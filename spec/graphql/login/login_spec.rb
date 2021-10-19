require 'rails_helper'

 RSpec.describe 'login api', type: :request do
   before(:each) do
     @code = "d282a578058fe70c9b0f"
   end

   it 'can create a new user from a github code' do
     json_response1 = File.read('spec/fixtures/user_token.json')

     stub_request(:post, "https://github.com/login/oauth/access_token?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}&code=d282a578058fe70c9b0f").
         with(
           headers: {
       	  'Accept'=>'application/json',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Length'=>'0',
       	  'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 200, body:  json_response1, headers: {})

       json_response2 = File.read('spec/fixtures/user_info.json')

       stub_request(:get, "https://api.github.com/user").
         with(
           headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'Authorization'=> 'Bearer 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',
           'User-Agent'=>'Faraday v1.8.0'
           }).
         to_return(status: 200, body: json_response2, headers: {})

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
       imageUrl
       token
      }
     }
   }
   GQL
   end
 end
