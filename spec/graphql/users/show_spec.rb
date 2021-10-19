require 'rails_helper'

RSpec.describe 'user API', type: :request do
  describe 'happy path' do
    before(:each) do
      @user = create(:user)
    end

    it 'can send user information' do
      post '/graphql', params: { query: query}

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:user]).to have_key(:nickname)
      expect(user[:data][:user][:nickname].class).to eq(String)
      expect(user[:data][:user][:nickname]).to eq(@user.nickname)
      expect(user[:data][:user]).to have_key(:imageUrl)
      expect(user[:data][:user][:imageUrl].class).to eq(String)
      expect(user[:data][:user][:imageUrl]).to eq(@user.image_url)
      expect(user[:data][:user]).to have_key(:token)
      expect(user[:data][:user][:token].class).to eq(String)
      expect(user[:data][:user][:token]).to eq(@user.token)
    end

    def query
      <<~GQL
      query {
        user(id: #{@user.id}) {
        nickname
        imageUrl
        token
      }
    }
    GQL
  end
end

describe 'sad path' do
  before(:each) do
    @user = create(:user)
  end

  it 'will not send information for a user that does not exist' do
    post '/graphql', params: { query: query}

    expect(response).to be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to have_key(:errors)
    expect(error[:errors].first).to have_key(:message)
    expect(error[:errors].first).to have_key(:locations)
  end

  def query
    <<~GQL
    query {
      user(id: ) {
        nickname
        email
        imageUrl
        token
      }
    }
    GQL
  end

  it 'will not send information for a user when there is a syntax error in the request' do
    post '/graphql', params: { query: syntax_error}

    expect(response).to be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to have_key(:errors)
    expect(error[:errors].first).to have_key(:message)
    expect(error[:errors].first).to have_key(:locations)
  end

  def syntax_error
    <<~GQL
    query {
      user(id: #{@user.id}) {
        nickname
        email
        image_url
        token
      }
    }
    GQL
  end
end
end
