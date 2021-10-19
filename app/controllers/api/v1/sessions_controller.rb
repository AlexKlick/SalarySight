class Api::V1::SessionsController < ApplicationController
  def index
    token = GithubService.get_user_access_token(params[:code])
    user_info = GithubService.get_user_information(token[:access_token])

    # user = User.find_or_create_by(email: email)
    # user.update(nickname: user_data[:login], image_url: user_data[:avatar_url], token: res[:access_token])
  end
end
