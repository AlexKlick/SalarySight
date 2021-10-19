class Api::V1::SessionsController < ApplicationController
  def index
    conn = Faraday.new(
    url: 'https://github.com',
    headers: {'Content-Type' => 'application/json'}
    )
    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = params[:code]
      req.params['client_id'] = ENV['client_id']
      req.params['client_secret'] = ENV['client_secret']
      req.headers['Accept'] = 'application/json'
    end
    res = JSON.parse(response.body,symbolize_names: true)
    connect = Faraday.new(
      url: 'https://api.github.com',
      headers: {'Authorization' => "Bearer #{res[:access_token]}"}
      )
    user_data = connect.get('/user')
    user_data = JSON.parse(user_data.body,symbolize_names: true)
    binding.pry
    user = User.find_or_create_by(email: email)
    user.update(nickname: user_data[:login], image_url: user_data[:avatar_url], token: res[:access_token])
  end

end