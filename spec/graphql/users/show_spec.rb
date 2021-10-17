require 'rails_helper'

RSpec.describe 'user API', type: :request do
  before(:each) do
    @user = create(:user)
  end

  it 'can send user information' do
    post '/graphql', params: { query: query}

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data][:user]).to have_key(:nickname)
    expect(user[:data][:user][:nickname].class).to eq(String)
    expect(user[:data][:user][:nickname]).to eq(@user.nickname)
    expect(user[:data][:user]).to have_key(:email)
    expect(user[:data][:user][:email].class).to eq(String)
    expect(user[:data][:user][:email]).to eq(@user.email)
    expect(user[:data][:user]).to have_key(:imageUrl)
    expect(user[:data][:user][:imageUrl].class).to eq(String)
    expect(user[:data][:user][:imageUrl]).to eq(@user.image_url)
    expect(user[:data][:user]).to have_key(:token)
    expect(user[:data][:user][:token].class).to eq(String)
    expect(user[:data][:user][:token]).to eq(@user.token)
  end

  def query
    #   user = create(:user)
    <<~GQL
    query {
      user(id: #{@user.id}) {
      nickname
      email
      imageUrl
      token
    }
  }
  GQL
end
end
