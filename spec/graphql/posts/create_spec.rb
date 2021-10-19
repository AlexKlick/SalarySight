require 'rails_helper'

 RSpec.describe 'create post api' do
   it 'can create a new post' do

   end

   def mutation
     <<~GQL
     mutation {
       createUser(input: {
         nickname: "example name"
         email: "example email"
         imageUrl: "example.example.com"
         token: "testblahqwe0ihfin2o3i"
       }) {
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
