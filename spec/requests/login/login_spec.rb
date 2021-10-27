require 'rails_helper'

RSpec.describe 'github oauth' do
  it 'can create a new user from github oauth' do
    json_response1 = File.read('spec/fixtures/user_token.json')

    stub_request(:post, "https://github.com/login/oauth/access_token?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}&code")
      .with(
        headers: {
          'Accept' => 'application/json',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Length' => '0',
          'User-Agent' => 'Faraday v1.8.0'
        }
      )
      .to_return(status: 200, body: json_response1, headers: {})

    json_response2 = File.read('spec/fixtures/user_info.json')

    stub_request(:get, 'https://api.github.com/user')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => 'Bearer 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',
          'User-Agent' => 'Faraday v1.8.0'
        }
      )
      .to_return(status: 200, body: json_response2, headers: {})

    expect(User.count).to eq(0)

    get '/sessions/create'

    expect(User.count).to eq(1)

    user = User.last

    expect(user.nickname).to eq("matttoensing")
    expect(user.image_url).to eq("https://avatars.githubusercontent.com/u/80132364?v=4")
    expect(user.token).to eq("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")
  end
end
