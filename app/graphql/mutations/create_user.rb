module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :code, String, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(code:)
      token = GithubService.get_user_access_token(code)
      user_info = GithubService.get_user_information(token[:access_token])

      user = User.find_or_create_by(nickname: user_info[:login])
      user.update(image_url: user_info[:avatar_url], token: token[:access_token])

      if user.save
        {
          user: user
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
