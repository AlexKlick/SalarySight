module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :posts, [Types::PostType], null: false
    field :user, Types::UserType, null: false do
      argument :id, Integer, required: true
    end

    field :post, Types::PostType, null: false do
      argument :id, Integer, required: true
    end

    def posts
      Post.all
    end

    def user(id:)
      User.find(id)
    end

    def post(id:)
      Post.find(id)
    end
  end
end
