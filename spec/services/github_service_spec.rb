require 'rails_helper'

 RSpec.describe GithubService do
   describe 'class methods' do
     it 'can make a github connection' do
       expect(GithubService.conn('https://github.com')).to be_an_instance_of(Faraday::Connection)
     end

     it 'can get a user access token from service', :vcr do
        json = GithubService.get_user_access_token('6525e647dbac22c13edc')

       expect(json).to have_key(:access_token)
       expect(json).to have_key(:token_type)
       expect(json).to have_key(:scope)
     end

     it 'can get information from service', :vcr do
        json = GithubService.get_user_information('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')

       expect(json).to have_key(:login)
       expect(json).to have_key(:avatar_url)
       expect(json).to have_key(:email)
     end
   end
 end
