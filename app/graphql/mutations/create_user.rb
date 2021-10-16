module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :nickname, String, required: true
    argument :email, String, required: true
    argument :image_url, String, required: true
    argument :token, String, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(nickname:, email:, image_url:, token:)
      user = User.create(nickname: nickname, email: email, image_url: image_url, token: token)
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