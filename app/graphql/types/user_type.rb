module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :nickname, String, null: true
    field :email, String, null: true
    field :image_url, String, null: true
    field :token, String, null: true
    
  end
end
