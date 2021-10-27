class GithubService
  def self.conn(url)
    Faraday.new(url)
  end

  def self.get_user_access_token(code)
    response = conn('https://github.com').post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = ENV['client_id']
      req.params['client_secret'] = ENV['client_secret']
      req.headers['Accept'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user_information(access_token)
    headers = { 'Authorization' => "Bearer #{access_token}" }
    response = conn(url: 'https://api.github.com', headers: headers).get('/user')
    JSON.parse(response.body, symbolize_names: true)
  end
end
