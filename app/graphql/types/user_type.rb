module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :nickname, String, null: false
    field :image_url, String, null: false
    field :token, String, null: false
  end
end
