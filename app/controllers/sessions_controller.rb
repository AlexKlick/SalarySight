class SessionsController < ApplicationController
  def create
    token = GithubService.get_user_access_token(params[:code])
    user_info = GithubService.get_user_information(token[:access_token])

    user = User.find_or_create_by(nickname: user_info[:login])
    user.update(image_url: user_info[:avatar_url], token: token[:access_token])

    redirect_to "http://localhost:3000/#{user.nickname}"
  end
end
