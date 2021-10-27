require 'rails_helper'

RSpec.describe GithubService do
  describe 'class methods' do
    it 'can make a github connection' do
      expect(GithubService.conn('https://github.com')).to be_an_instance_of(Faraday::Connection)
    end

    it 'can get a user access token from service' do
      json_response = File.read('spec/fixtures/user_token.json')

      stub_request(:post, "https://github.com/login/oauth/access_token?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}&code=aebd1347bcde0d0b57ee")
        .with(
          headers: {
            'Accept' => 'application/json',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Length' => '0',
            'User-Agent' => 'Faraday v1.8.0'
          }
        )
        .to_return(status: 200, body: json_response, headers: {})

      json = GithubService.get_user_access_token('aebd1347bcde0d0b57ee')

      expect(json).to have_key(:access_token)
      expect(json).to have_key(:token_type)
      expect(json).to have_key(:scope)
    end

    it 'can get information from service' do
      json_response = File.read('spec/fixtures/user_info.json')

      stub_request(:get, 'https://api.github.com/user')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Authorization' => 'Bearer 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',
            'User-Agent' => 'Faraday v1.8.0'
          }
        )
        .to_return(status: 200, body: json_response, headers: {})

      json = GithubService.get_user_information('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')

      expect(json).to have_key(:login)
      expect(json).to have_key(:avatar_url)
      expect(json).to have_key(:email)
    end
  end
end
